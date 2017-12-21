class ChargesController < ApplicationController
  before_action :total_cost

  def new
    @order = current_user.orders.find(params[:order]) if params[:order]
  end

  def create
    if current_user.stripe_customer_id
      @customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
      @customer.sources.create({:source => current_user.stripeToken})
    else
      create_customer
    end
    create_charge
    checkout_method
    redirect_to user_orders_path(current_user)
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  private

  def total_cost
    @amount = params[:total]
  end

  def create_customer
    @customer = StripeTool.create_customer(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  end

  def create_charge
    StripeTool.create_charge(
      :customer_id    => @customer.id,
      :amount      => @amount.to_i,
      :description => 'Rails Stripe customer'
    )
    current_user.stripe_token= params[:stripeToken]
    current_user.stripe_customer_id = @customer.id
  end

  def create_order
    item_hash = @cart.cart_items
    item_hash.each do |item, quantity|
      order = Order.create(status: "paid", user_id: current_user.id, store_id: item.store.id)
      order.order_items.create(quantity: quantity, original_item_price: item.price, item: item)
    end
    @cart.destroy
    flash[:success] = "Order was successfully placed"
  end

  def pay_order
    order = current_user.orders.find(params[:order])
    order.update(status: 'paid')
  end

  def checkout_method
    if params[:order]
      pay_order
    else
      create_order
    end
  end

end
