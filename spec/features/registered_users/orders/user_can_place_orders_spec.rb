require 'rails_helper'

feature "User can place an order" do
    let(:user) {create(:user)}
    let(:item) {create(:item)}

<<<<<<< HEAD
=======

    user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing", address: "dummy address")

    visit store_item_path

    click_on "Add to cart"

>>>>>>> wip create
      before(:each) do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit store_item_path(item.store.url, item.url)
        click_on "Add to Cart"
      end

  it "User can add an item to the cart" do


    expect(page).to have_content("You now have 1 #{item.title}.")
  end
<<<<<<< HEAD
=======

>>>>>>> wip create

  it "Can checkout if logged in as a user without Stripe" do

    visit cart_path
    click_on "Checkout"

    expect(page).to have_content("Order was successfully placed")
    expect(current_path).to eq(user_orders_path(user))

<<<<<<< HEAD
=======

    click_on "Cart"

    expect(page).to have_content("Checkout")

>>>>>>> wip create
  end

  it "Can checkout with Stripe" do
    visit cart_path
    click_on "Checkout Instantly with Stripe"

    expect(current_path).to eq(new_charge_path)

    expect(page).to have_content("Amount ")
  end
end
