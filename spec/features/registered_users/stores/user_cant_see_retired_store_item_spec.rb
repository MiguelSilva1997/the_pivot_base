require 'rails_helper'

RSpec.describe 'As a registered user' do
	context 'when visiting an items show page' do
		let(:user)	{create(:user)}
		let(:store)	{create(:store)}

		before do
			stub_login(user)
		end

		it 'a user cannot see a retired item' do
			store.items << create(:item, status: "retired")
			item = store.items.first
			visit store_path(store.url)

			expect(page).not_to have_content(item.title)
		end

		it 'a user can see an active item' do
      store.items << create(:item)
			item = store.items.first
			visit store_path(store.url)

			expect(page).to have_content(item.title)
		end
	end
end
