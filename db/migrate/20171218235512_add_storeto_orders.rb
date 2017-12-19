class AddStoretoOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :store, index: true
  end
end
