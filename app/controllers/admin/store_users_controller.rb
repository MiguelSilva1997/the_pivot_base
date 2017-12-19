class Admin::StoreUsersController < ApplicationController

  def new
    @store_user = StoreUser.new
    @roles = Role.all
  end

  def create
    user = User.find_by(email: params[:store_user][:user_id])
    store = Store.find_by(url: params[:store_name])
    role = Role.find(params[:store_user][:role_id])
    store_user = StoreUser.create(user_id: user.id, store_id: store.id, role_id: role.id)
    if store_user.save
      redirect_to admin_store_path(store.url)
    else
      render :new
    end
  end

  def edit
    store = Store.find_by(url: params[:store_name])
    @store_user = StoreUser.find_by(user_id: params[:id], store_id: store.id)
    @roles = Role.all
  end

  def update
    store = Store.find_by(url: params[:store_name])
    store_user = StoreUser.find_by(user_id: params[:id], store_id: store.id)
    if store_user.update(role_id: params[:store_user][:role_id])
      redirect_to admin_store_path(store.url)
    else
      render :new
    end
  end

  def destroy
    store = Store.find_by(url: params[:store_name])
    store_user = StoreUser.find_by(user_id: params[:id], store_id: store.id)
    store_user.destroy
    redirect_to admin_store_path(store.url)
  end

end
