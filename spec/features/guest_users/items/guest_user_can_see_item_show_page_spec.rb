require 'rails_helper'

feature "guest user clicks on item link" do
  let(:store) {create(:store_with_items)}
  let(:item) { store.items.first }

  before do
    visit store_path(store.url)
    click_link "#{item.title}"
  end

  it "and sees details for that item" do
    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)
    expect(first("img")['alt']).to have_content(item.title)
  end
end
