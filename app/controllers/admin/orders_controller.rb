class Admin::OrdersController < ApplicationController

  def index
    @store = current_user.stores.find_by(url: params[:store_name])
    @orders = @store.orders
<<<<<<< HEAD

=======
>>>>>>> 018b4642eea744e47928c1e7a4000164d0542ada
  end

  def show
    @store = current_user.stores.find_by(url: params[:store_name])
    @order = Order.find(params[:id])
  end
<<<<<<< HEAD

  def update

    @store = current_user.stores.find_by(url: params[:store_name])
    @order = Order.find(params[:id])

    if @order.update(order_params)
      flash[:success] = "#{@order.id} successfully updated"
      redirect_to admin_store_path(@store.url)
    else
      flash[:danger] = "Please try updating again"
      redirect_to admin_store_orders_path(store.url)
    end
  end

  private

  def order_params
    params.permit(:status)
  end

=======
>>>>>>> 018b4642eea744e47928c1e7a4000164d0542ada
end
