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

    it "a user can increase quantity in cart" do
      user = create(:user)
      store = create(:store_with_item)
			stub_login(user)

      visit store_path(store.url)
      click_on "Add to Cart"

      visit cart_path
      click_on("Increase")
      save_and_open_page


      expect(page).to have_content("2")
    end

    it "a user can decrease quantity in cart" do
      user = create(:user)
      store = create(:store_with_item)
			stub_login(user)

      visit store_path(store.url)
      click_on "Add to Cart"
      click_on "Add to Cart"

      visit cart_path
      click_on("Decrease")


      expect(page).to have_content("1")
    end

    it "a user can remove item from cart" do
      user = create(:user)
      store = create(:store_with_item)
			stub_login(user)

      visit store_path(store.url)
      click_on "Add to Cart"

      visit cart_path
      click_on("Remove")


      expect(page).to have_content("Successfully removed #{store.items.first.title} from your cart.")
    end
	end
end
