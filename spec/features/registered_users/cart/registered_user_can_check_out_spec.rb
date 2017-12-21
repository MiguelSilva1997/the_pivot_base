require 'rails_helper'

RSpec.describe 'As a user' do
	context 'when checking out' do
		it 'a user can add an item to cart' do
      user = create(:user)
      store = create(:store_with_item)
			stub_login(user)

      visit store_path(store.url)
      click_on "Add to Cart"

      expect(current_path).to eq(store_path(store.url))
      expect(page).to have_content("You now have 1 #{store.items.first.title}")
		end

    it "a user can change quantity in cart" do
      user = create(:user)
      store = create(:store_with_item)
			stub_login(user)

      visit store_path(store.url)
      click_on "Add to Cart"

      visit cart_path
      save_and_open_page
      second(".badge").click
      # click_on(class: 'badge')

      expect(page).to have_content("2")
    end
	end
end
