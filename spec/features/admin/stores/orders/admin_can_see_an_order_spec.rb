require 'rails_helper'

feature "Admin can see an order associated with a store" do
<<<<<<< HEAD
  let(:admin) { create(:store_admin_with_store_order) }
  let(:user)  { create(:user) }
  let(:store) { admin.stores.first }
  let(:order) { store.orders.first }
=======
  let(:admin) { create(:store_admin_with_store_items) }
  let(:user)  { create(:user) }
  let(:store) { admin.stores.first }
  let(:item)  { store.items.first }
  let (:order) {create(:order, user: user)}
  let(:order_items) {create(:order_item, order: order, item: item, quantity: 1)}
>>>>>>> 018b4642eea744e47928c1e7a4000164d0542ada

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  context "As an authenticated store admin" do
<<<<<<< HEAD
    it 'I can see a specific order for the store' do
=======
    it 'I can see all orders for the store' do

      visit admin
>>>>>>> 018b4642eea744e47928c1e7a4000164d0542ada

      visit admin_store_order_path(store.url, order)


<<<<<<< HEAD
      expect(page).to have_content(order.id)
      expect(page).to have_content(order.date)
      expect(page).to have_content(order.status.titleize)
    end

    it 'I can update the status of a specific order' do
      visit admin_store_order_path(store.url, order)
      click_on "Cancel"


      expect(page).to have_content("#{order.id} successfully updated")
      admin_store_path(store.url)

    end
  end
end
=======

      expect(page).to have_content(order.id)
      expect(page).to have_content(order.date)
      expect(page).to have_content(order.status)
    end
  end
end



# and I can see the total number of orders for each status (ordered, paid, cancelled, completed)
# and I can see a link for each individual order
# and I have links that transition between statuses
# I can click on “cancel” on individual orders which are “paid” or “ordered”
# I can click on “mark as paid” on orders that are “ordered”
# I can click on “mark as completed” on orders that are “paid”

    # xit "I can see the total number of orders for each status" do
    #   visit admin_dashboard_index_path
    #
    #   expect(page).to have_content(order_1.id)
    #   expect(page).to have_content(order_1.date)
    #   expect(page).to have_content(order_1.status.capitalize)
    # end
    #
    # xit "I can see orders filtered by status" do
    #   visit admin_dashboard_index_path
    #
    #   click_on("Ordered")
    #
    #   expect(current_path).to eq(admin_dashboard_index_path)
    #   expect(page).to have_link(order_1.id, href: order_path(order_1))
    #   expect(page).not_to have_link(order_2.id)
    # end
    #
    # xit "I can change the status of orders" do
    #   visit admin_dashboard_index_path
    #
    #   within(".order-#{order_2.id}") do
    #     click_on("Cancel")
    #   end
    #
    #   expect(current_path).to eq(admin_dashboard_index_path)
    #
    #   within(".order-#{order_2.id}") do
    #     expect(page).to have_content("Cancelled")
    #   end
    #
    #   within(".order-#{order_1.id}") do
    #     click_on("Mark as Paid")
    #   end
    #
    #   xexpect(current_path).to eq(admin_dashboard_index_path)
    #
    #   within(".order-#{order_1.id}") do
    #     within(".status") do
    #       expect(page).to have_content("Paid")
    #     end
    #   end
    #
    #   within(".order-#{order_1.id}") do
    #     click_on("Mark as Completed")
    #   end
    #
    #   expect(current_path).to eq(admin_dashboard_index_path)
    #
    #   within(".order-#{order_1.id}") do
    #     within(".status") do
    #       expect(page).to have_content("Completed")
    #     end
    #   end
    # end
>>>>>>> 018b4642eea744e47928c1e7a4000164d0542ada
