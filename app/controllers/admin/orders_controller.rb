class Admin::OrdersController < ApplicationController

  def index
    @store = current_user.stores.find_by(url: params[:store_name])
    @orders = @store.orders
  end

  def show
    @store = current_user.stores.find_by(url: params[:store_name])
    @order = Order.find(params[:id])
    @statuses = Order.statuses.keys
  end

  def update
    store = current_user.stores.find_by(url: params[:store_name])
    order = Order.find(params[:id])

    if order.update(order_params)
      flash[:success] = "Order ##{order.id} successfully updated"
      redirect_to admin_store_order_path(store.url)
    else
      flash[:danger] = "Please try updating again"
      redirect_to admin_store_orders_path(store.url)
    end
  end

  private

  def order_params
    params.permit(:status)
  end

end
