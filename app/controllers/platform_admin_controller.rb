class PlatformAdminController < ApplicationController

  def index
    if params[:status]
      @stores = Store.where(status: params[:status])
    else
      @stores = Store.all
    end
    @allstores = Store.all
  end

end
