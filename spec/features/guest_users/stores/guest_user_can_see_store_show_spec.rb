require 'rails_helper'

feature "a guest user visits a specific store" do
  let(:active_store) {create(:store_with_inactive_items, status: 'active')}
  let(:pending_store) {create(:store, status: 'pending')}
  let(:declined_store) {create(:store, status: 'declined')}
  let(:suspended_store) {create(:store, status: 'suspended')}
  let(:inactive_item) {active_store.items.last}

  context "they visit an active store" do
    before do
      @non_store_item = create(:item)
      visit store_path(active_store.url)
    end

    it "they see store information for an active store" do
      expect(page).to have_content(active_store.name)
    end

    it "they see all active items associated with that store" do
      expect(page).to have_link(active_store.items.first.title)
      expect(page).to have_link(active_store.items.second.title)
    end

    it "they do not see inactive items associated with that store" do
      expect(page).to_not have_link(inactive_item.title)
    end

    it "they do not see items associated with other stores" do
      expect(page).to_not have_link(@non_store_item.title)
    end
  end

  context "they attempt to visit an inactive store" do
    it "they see a 404 for a pending store" do
      expect {
        visit store_path(pending_store.url)
      }.to raise_error(ActionController::RoutingError)
    end

    it "they see a 404 for a declined store" do
      expect {
        visit store_path(declined_store.url)
      }.to raise_error(ActionController::RoutingError)
    end

    it "they see a 404 for a suspended store" do
      expect {
        visit store_path(suspended_store.url)
      }.to raise_error(ActionController::RoutingError)
    end

  end
end
