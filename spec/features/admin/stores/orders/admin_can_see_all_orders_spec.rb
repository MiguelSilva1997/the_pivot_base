require 'rails_helper'

feature "Store Admin can see all orders associated with a store" do
  let(:admin) { create(:store_admin_with_store_order) }
  let(:user)  { create(:user) }
  let(:store) { admin.stores.first }
  let(:order) { store.orders.first }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  context "As an authenticated store admin" do
    it 'I can see all orders for the store' do

      visit admin_store_path(store.url)

      click_on "See All Orders for this Store"

      expect(current_path).to eq(admin_store_orders_path(store.url))


      expect(page).to have_content(order.id)
      expect(page).to have_content(order.date)
      expect(page).to have_content(order.status.titleize)
    end
  end

  it "I can see the total number of orders for each status" do
    visit admin_store_orders_path(store.url)

    expect(page).to have_content("Ordered")
  end

  it "I can see a link to edit an order" do
    visit admin_store_orders_path(store.url)

    click_on "Edit Order"
    expect(current_path).to eq(admin_store_order_path(store.url, order))
  end

  it "I can see a link to see a specifc order details" do
    visit admin_store_orders_path(store.url)

    click_on "#{order.id}"
    expect(current_path).to eq(admin_store_order_path(store.url, order))
  end
end

feature "Store manager can see all orders associated with a store" do
  let(:admin) { create(:store_manager_with_store_order) }
  let(:user)  { create(:user) }
  let(:store) { admin.stores.first }
  let(:order) { store.orders.first }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  context "As an authenticated store manager" do
    it 'I can see all orders for the store' do

      visit admin_store_path(store.url)

      click_on "See All Orders for this Store"

      expect(current_path).to eq(admin_store_orders_path(store.url))


      expect(page).to have_content(order.id)
      expect(page).to have_content(order.date)
      expect(page).to have_content(order.status.titleize)
    end
  end

  it "I can see the total number of orders for each status" do
    visit admin_store_orders_path(store.url)

    expect(page).to have_content("Ordered")
  end

  it "I cannot see a link to edit an order" do
    visit admin_store_orders_path(store.url)


    expect(page).to_not have_content("Edit Order")
  end

  it "I can see a link to see a specifc order details" do
    visit admin_store_orders_path(store.url)

    click_on "#{order.id}"
    expect(current_path).to eq(admin_store_order_path(store.url, order))
  end

end
