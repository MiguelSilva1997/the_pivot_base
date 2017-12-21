require 'rails_helper'

RSpec.describe StoreUser, type: :model do
  describe 'realtionships' do

    it 'belongs to a user' do
      storeUser = build(:store_user)
      expect(storeUser).to respond_to(:user)
    end

    it 'belongs to a store' do
      storeUser = build(:store_user)
      expect(storeUser).to respond_to(:store)
    end
    it 'belongs to a role' do
      storeUser = build(:store_user)
      expect(storeUser).to respond_to(:role)
    end
  end
end
