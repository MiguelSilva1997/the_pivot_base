require 'rails_helper'

feature " Store Admin can create an item" do
  before(:all) do
    @admin = create(:user)
    role = create(:role, name: "store_admin")
    @store = create(:store)
    item = create(:item)
    @store.items << item
     create(:store_user, user: @admin, role: role, store: @store)
  end

  context "As an authenticated store admin" do
    it "I can create an item" do
      login_user(@admin.email, @admin.password)

      visit admin_store_path(@store.url)
      click_on "See all Items"

      expect(current_path).to eq(admin_store_items_path(@store.url))

      click_on "Create New Item"

      fill_in "item[title]", with: "Onesie"
      fill_in "item[description]", with: "This Onesie is awesome!"
      fill_in "item[price]", with: "59.99"
      page.attach_file("item[image]", testing_image)
      click_on "Create Item"

      expect(current_path).to eq(admin_store_items_path(@store.url))

      expect(page).to have_content("Onesie")
      expect(page).to have_content("59.99")
    end

    it "I can create an item without an image and it defaults" do
      login_user(@admin.email, @admin.password)

      visit admin_store_path(@store.url)
      click_on "See all Items"

      click_on "Create New Item"

      fill_in "item[title]", with: "Onesie"
      fill_in "item[description]", with: "This Onesie is awesome!"
      fill_in "item[price]", with: "59.99"
      click_on "Create Item"

      expect(current_path).to eq(admin_store_items_path(@store.url))
      expect(page).to have_content("Onesie")
      expect(page).to have_content("59.99")
    end
  end
end
