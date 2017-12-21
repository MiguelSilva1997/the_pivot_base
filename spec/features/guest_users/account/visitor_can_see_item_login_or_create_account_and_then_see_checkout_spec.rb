require "rails_helper"

feature "As a visitor" do
  let(:store) {create(:store_with_items)}
  let(:item) { store.items.first }

  describe "when I visit my cart" do
    it "I can sign up or log in" do
      item = create(:item, title: "Banana Stand")
      visit store_item_path(item.store.url, item.url)
      click_on "Add to Cart"

      visit cart_path
      
      expect(page).to have_content("Create new account")
      expect(page).to have_content("Login")
      expect(page).to_not have_content("Checkout")

      click_on "Create new account"
      fill_in "user[first_name]", with: "Tester"
      fill_in "user[last_name]", with: "McTesty"
      fill_in "user[email]", with: "testerson@testmail.com"
      fill_in "user[password]", with: "testing"
      click_on "Submit"

      visit cart_path

      expect(page).to have_content(item.title)
      expect(page).to have_content("1")
    end
  end
end
