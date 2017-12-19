FactoryBot.define do
  factory :order do
    user
    store

    factory :ordered_order do
      status 0
    end

    factory :paid_order do
      status 1
    end

    factory :shipped_order do
      status 2
    end

    factory :completed_order do
      status 3
    end

    transient do
      items_with_quantity [{create(:item) => 1}]
    end


    factory :order_with_items do
      after(:create) do |paid_order, evaluator|
        evaluator.items_with_quantity.each do |item_with_quantity|
          item     = create(:item)
          quantity = item_with_quantity.values.first
          create(:order_item, order: paid_order, item: item, quantity: quantity)
        end
      end
    end
  end
end
