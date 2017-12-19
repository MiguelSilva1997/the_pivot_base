require 'rails_helper'

feature "Admin can see an order associated with a store" do
  let(:admin) { create(:store_admin_with_store_order) }
  let(:user)  { create(:user) }
  let(:store) { admin.stores.first }
  let(:order) { store.orders.first }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  context "As an authenticated store admin" do
    it 'I can see a specific order for the store' do

      visit admin_store_order_path(store.url, order)

      expect(page).to have_content(order.id)
      expect(page).to have_content(order.date)
      expect(page).to have_content(order.status)
    end
  end
end
