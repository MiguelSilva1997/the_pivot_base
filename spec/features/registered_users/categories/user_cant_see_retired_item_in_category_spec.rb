require 'rails_helper'

RSpec.describe 'As a registered user' do
	context 'when visiting an items show page' do
		let(:user)	{create(:user)}
		let(:category)	{create(:category)}

		before do
			stub_login(user)
		end

		it 'a user cannot see a retired item' do
			category.items << create(:item, status: "retired")
			item = category.items.first
			visit category_path(category.url)

			expect(page).not_to have_content(item.title)
		end

		it 'a user can see an active item' do
			category.items << create(:item)
			item = category.items.first
			visit category_path(category.url)

			expect(page).to have_content(item.title)
		end
	end
end
