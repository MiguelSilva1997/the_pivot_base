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
      expect(page).to have_content(order.status.titleize)
    end

    it 'I can update the status of a specific order' do
      visit admin_store_order_path(store.url, order)
      select 'cancelled', from: "status"
      click_on("Update Status")

      expect(current_path).to eq(admin_store_order_path(store.url, order))
      expect(page).to have_content("Current Status: Cancelled")
      expect(page).to have_content("Order ##{order.id} successfully updated")
    end
  end
end

feature "Platform Admin can see an order associated with a store" do
  let(:admin) { create(:platform_admin_with_store_order) }
  let(:user)  { create(:user) }
  let(:store) { admin.stores.first }
  let(:order) { store.orders.first }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  context "As an authenticated platform admin" do
    it 'I can see a specific order for the store' do

      visit admin_store_order_path(store.url, order)

      expect(page).to have_content(order.id)
      expect(page).to have_content(order.date)
      expect(page).to have_content(order.status.titleize)
    end

    it 'I can update the status of a specific order' do
      visit admin_store_order_path(store.url, order)
      select 'cancelled', from: "status"
      click_on("Update Status")

      expect(current_path).to eq(admin_store_order_path(store.url, order))
      expect(page).to have_content("Current Status: Cancelled")
      expect(page).to have_content("Order ##{order.id} successfully updated")
    end
  end
end

feature "Store Manager can see an order associated with a store" do
  let(:admin) { create(:store_manager_with_store_order) }
  let(:user)  { create(:user) }
  let(:store) { admin.stores.first }
  let(:order) { store.orders.first }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  context "As an authenticated store manager" do
    it 'I can see a specific order for the store' do

      visit admin_store_order_path(store.url, order)

      expect(page).to have_content(order.id)
      expect(page).to have_content(order.date)
      expect(page).to have_content(order.status.titleize)
    end

    it 'I cannot update the status of a specific order' do
      visit admin_store_order_path(store.url, order)

      expect(page).to_not have_content("Update Status")
    end
  end
end
