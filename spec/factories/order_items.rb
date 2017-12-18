FactoryBot.define do
  factory :order_item do
    item
    order
    quantity 1
    original_item_price 10.00
  end
end
