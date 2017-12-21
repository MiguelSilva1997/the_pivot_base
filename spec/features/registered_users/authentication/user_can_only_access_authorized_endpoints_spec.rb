require 'rails_helper'

RSpec.feature "As a registered user" do
  let(:unauthorized_user)  { create(:user) }
  let(:user)  { create(:user) }
  let(:order) { create(:order_with_items, user: user) }
  let(:item)  { order.items.first }
  let(:store) { item.store }
  let(:category)  { item.category }

  context "I cannot access other user information" do
    before do
      stub_login(unauthorized_user)
    end

    it "I cannot view another user's orders" do
      expect {
        visit user_orders_path(user)
      }.to raise_error(ActionController::RoutingError)
    end

    it "I cannot view another user's individual order" do
      expect {
        visit user_order_path(user, order)
      }.to raise_error(ActionController::RoutingError)
    end
  end

  context "I cannot view the administrator pages" do
    it "i cannot view a store manager dashboard" do
      expect {
        visit store_manager_dashboard_path
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot view a store admin dashboard" do
      expect {
        visit store_admin_dashboard_path
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot view a platform admin dashboard" do
      expect {
        visit platform_admin_dashboard_path
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot view a platform admin categories index" do
      expect {
        visit platform_admin_categories_path
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot create a new category" do
      expect {
        visit new_platform_admin_category_path
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot edit a category" do
      expect {
        visit edit_platform_admin_category_path(category)
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot edit a global user" do
      expect {
        visit edit_platform_admin_user_path(user)
      }.to raise_error(ActionController::RoutingError)
    end

    xit "i cannot add a global user" do
      expect {
        visit new_platform_admin_user_path
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot see a list of all global users" do
      expect {
        visit platform_admin_users_path
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot edit store users" do
      expect {
        admin = create(:store_admin)
        visit admin_edit_store_user_path(store.url, admin)
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot create store users" do
      expect {
        visit admin_new_store_user_path(store.url)
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot create store items" do
      expect {
        visit admin_new_store_item_path(store.url)
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot edit store items" do
      expect {
        visit admin_edit_store_item_path(store.url, item.url)
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot see global items" do
      expect {
        visit admin_store_items_path(store.url)
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot see admin order" do
      expect {
        visit admin_store_order_path(store.url, order)
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot see all store orders" do
      expect {
        visit admin_store_orders_path(store.url)
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot see admin store details" do
      expect {
        visit admin_store_path(store.url)
      }.to raise_error(ActionController::RoutingError)
    end

    it "i cannot see edit store details" do
      expect {
        visit admin_edit_store_path(store.url)
      }.to raise_error(ActionController::RoutingError)
    end
  end

end
