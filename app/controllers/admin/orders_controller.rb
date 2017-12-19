class Admin::OrdersController < ApplicationController

  def index
    @store = current_user.stores.find_by(url: params[:store_name])
    @orders = @store.orders
  end

  def show
    @store = current_user.stores.find_by(url: params[:store_name])
    @order = Order.find(params[:id])
  end
end
