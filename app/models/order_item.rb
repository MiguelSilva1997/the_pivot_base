class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def self.sum_quantity
    group(:item_id)
  end

  def subtotal
    quantity * original_item_price
  end



#   def self.subtotal(id, quantity)
#   quantity * freelancers.find(id).price
#   end
#
# def total
#   grouped_freelancers.map do |id, quantity|
#     quantity * freelancers.find(id).price
#   end.sum
# end

  def self.top_three_items
    item_hash = self.group(:item_id).count
    popular_items = item_hash.sort_by {|key, value| value}.to_h
    ids = popular_items.keys.reverse[0..2]
    ids.map do |id|
      Item.find(id)
    end
  end

  def self.average_quantity
    average(:quantity).to_i
  end

end
