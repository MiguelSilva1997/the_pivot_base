class OrdersController < ApplicationController
  before_action :require_current_user, :valid_user

  def index
    @user = current_user
    @user.orders.preload(:items)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order.save
    redirect_back(fallback_location: root_path)
  end

  def create
    item_hash = @cart.cart_items
		item_hash.each do |item, quantity|
      order = Order.create(status: "ordered", user_id: current_user.id, store_id: item.store.id)
			order.order_items.create(quantity: quantity, original_item_price: item.price, item: item)
		end
		@cart.destroy
    flash[:success] = "Order was successfully placed"
    redirect_to user_orders_path(current_user)
  end

  private

  def require_current_user
    redirect_to login_path unless current_user
  end

  def valid_user

    if params[:user_id]
      not_found unless current_user.id == params[:user_id].to_i
    end

  end

  def order_params
    params.permit(:status, :user_id)
  end

end
