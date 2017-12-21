require 'rails_helper'

RSpec.describe 'As a visitor' do
	describe 'when visiting an items show page' do
		it 'a user cannot see add to cart for a retired item' do
			category = Category.create(title: "Animals")
			one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
			store = create(:store)
			item_one = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
			image: one_url, status: 'retired', store_id: store.id )

			visit  store_item_path(store.url, item_one.url)

			expect(page).not_to have_content("Add to cart")
		end
	end
end
