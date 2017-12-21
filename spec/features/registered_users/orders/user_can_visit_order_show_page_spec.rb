require 'rails_helper'

describe "As a user" do
  describe "visit  user_order_path" do
    it "can see the details for the past order" do
      user = create(:user)
      item = create(:item, price: 5.00)
      items_with_quantity = [ {item => 2} ]
      order = create(:order_with_items, user: user, items_with_quantity: items_with_quantity)
      login_user(user.email, user.password)

      visit user_orders_path(user.id)

<<<<<<< HEAD
      visit user_orders_path(user)
=======
>>>>>>> development
      click_on order.id


      expect(current_path).to eq(user_order_path(user, order))
      expect(page).to have_content("Total: $10.00")
    end
  end
end
