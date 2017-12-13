class Store < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles
  has_many :store_items
  has_many :items, through: :store_items
end
