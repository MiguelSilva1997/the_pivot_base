class AddStoretoOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :stores, index: true
  end
end
