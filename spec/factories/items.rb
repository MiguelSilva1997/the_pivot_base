FactoryBot.define do
  factory :item do
    sequence(:title) {|n| "Item #{n}" }
    description "Dead dove. Do not eat."
    price 10.00
    image_file_name "./spec/support/images/test_image.jpg"
    category
    store
  end
end
