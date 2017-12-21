class Role < ApplicationRecord
  validates :name,  presence: true
  has_many :store_users
  has_many :users, through: :store_users
end
