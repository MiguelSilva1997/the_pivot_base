require 'rails_helper'
RSpec.describe "As a visitor can visit category show page" do
  let(:user)  { create(:user) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "can see all items belonging to a category" do
    category1 = create(:category, title: "cats")
    category1.items << create_list(:item, 3)
    non_category_item = create(:item)
    visit category_path(category1.url)

    expect(current_path).to eq("/categories/#{category1.url}")
    expect(page).to have_content(category1.items.first.title)
    expect(page).to have_content(category1.items.second.title)
    expect(page).to have_content(category1.items.third.title)
    expect(page).to_not have_content(non_category_item.title)
  end

end
