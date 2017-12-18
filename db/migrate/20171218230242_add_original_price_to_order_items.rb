class AddOriginalPriceToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :original_item_price, :float
  end
end
