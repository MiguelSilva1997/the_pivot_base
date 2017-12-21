require 'rails_helper'

feature "guest user clicks on item link" do
  let(:store) {create(:store_with_items)}
  let(:item) { store.items.first }

  before do
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
