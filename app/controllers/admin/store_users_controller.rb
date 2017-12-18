class Admin::StoreUsersController < ApplicationController

  def new
    @store_user = StoreUser.new
    @roles = Role.all 
  end

  def create
    binding.pry
    @user = User.find_by(email: params[:store_user][:user_id])
    @store = Store.find_by(url: params[:store_name])


  end

  def edit
  end

  def update

  end

  def destroy
  end

  def destroy
  end
end
