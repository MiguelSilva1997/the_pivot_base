class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def show
		@item = Item.find_by(url: params[:item_name])
	end
end
