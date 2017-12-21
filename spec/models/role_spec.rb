require 'rails_helper'

describe 'validations' do
  describe 'invalid attributes' do
    it 'is invalid without a name' do
      role = build(:role, name: nil)
      expect(role).to be_invalid
    end

    it "is valid with a name" do
      role = build(:role, name: "store_admin")
      expect(role).to be_valid
    end
  end
end
