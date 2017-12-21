class StoresController < ApplicationController
  def new
    @store = Store.new
  end

  def create
    user = current_user
    platform_admin = User.find_by(role:1)
    store = Store.new(store_params)

    if store.save
      store_admin_role = Role.find_or_create_by(name: "store_admin")
      platform_admin_role = Role.find_or_create_by(name: "platform_admin")
      StoreUser.create(user: user, role: store_admin_role, store: store)
      StoreUser.create(user: platform_admin, role: platform_admin_role, store: store)
      flash[:success] = "You have successfully submitted an application for #{store.name}!"
      redirect_back(fallback_location: dashboard_index_path)
    else
      flash[:danger] = "Please try your application again."
      render :new
    end
  end

  def show
    @store = Store.find_by(url: params[:store_name])
    not_found unless @store.status == "active"
  end

  private
      def store_params
        params.require(:store).permit(:name)
      end
end
