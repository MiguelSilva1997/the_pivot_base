require 'rails_helper'

RSpec.describe Store do
  context "invalid attributes" do

    it "is invalid without name" do
      store = build(:store, name: nil)
      expect(store).to be_invalid
    end
  end
end

describe "relationships" do
  it "has many store users" do
    store = build(:store)
    expect(store).to respond_to(:store_users)
  end

  it "has many users" do
    store = build(:store)
    expect(store).to respond_to(:users)
  end

  it "has many items" do
    store = build(:store)
    expect(store).to respond_to(:items)
  end

  it "has many orders" do
    store = build(:store)
    expect(store).to respond_to(:orders)
  end

  describe '#status' do
  let(:status) { [:pending, :declined, :active, :suspended] }

    it 'has the right index' do
      status.each_with_index do |status, index|
        expect(Store.statuses[status]).to eq index
      end
    end
  end

  context "instance methods" do
    it "generates url" do
      store = Store.create(name: "Test Store")
      expect(store.url).to eq(store.name.parameterize)
    end
  end
end
