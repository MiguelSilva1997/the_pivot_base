require 'rails_helper'

feature "Admin can see an order associated with a store" do
  let(:admin) { create(:store_admin_with_store_items) }
  let(:user)  { create(:user) }
  let(:store) { admin.stores.first }
  let(:item)  { store.items.first }
  let (:order) {create(:order, user: user)}
  let(:order_items) {create(:order_item, order: order, item: item, quantity: 1)}

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  context "As an authenticated store admin" do
    it 'I can see all orders for the store' do

      visit admin

      visit admin_store_order_path(store.url, order)




      expect(page).to have_content(order.id)
      expect(page).to have_content(order.date)
      expect(page).to have_content(order.status)
    end
  end
end
