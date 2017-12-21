require 'rails_helper'

RSpec.feature "User can place an order" do
  it "and see the message order was successfully placed'" do
    user = create(:user)
    item = create(:item)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit store_item_path(item.store.url, item.url)


    click_on "Add to Cart"

    expect(page).to have_content("You now have 1 #{item.title}.")
  end
end
