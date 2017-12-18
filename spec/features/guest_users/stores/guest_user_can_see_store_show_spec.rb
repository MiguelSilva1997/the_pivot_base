require 'rails_helper'

feature "a guest user visits a specific store" do
  let(:active_store) {create(:store_with_items, status: 'active')}
  let(:pending_store) {create(:store, status: 'pending')}
  let(:declined_store) {create(:store, status: 'declined')}
  let(:suspended_store) {create(:store, status: 'suspended')}

  context "they visit an active store" do
    before do
      visit store_path(active_store.url)
    end

    it "they see store information for an active store" do
      expect(page).to have_content(active_store.name)
    end

    it "they see all items associated with that store" do
      expect(page).to have_link(active_store.items.first.title)
      expect(page).to have_link(active_store.items.second.title)
      expect(page).to have_link(active_store.items.third.title)
      expect(page).to have_link(active_store.items.last.title)
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
