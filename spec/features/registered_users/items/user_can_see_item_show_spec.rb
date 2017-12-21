require 'rails_helper'

feature "registered user clicks on item link" do
  let(:store) {create(:store_with_items)}
  let(:item) { store.items.first }
  let(:user)  { create(:user) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit store_path(store.url)
    click_link "#{item.title}"
  end

  it "and sees details for that item" do
    expect(current_path).to eq(store_item_path(store.url, item.url))
    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)
    expect(page).to have_css("img[src*='#{item.image.url}']")
  end
end
