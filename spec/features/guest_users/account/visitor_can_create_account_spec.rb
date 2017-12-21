require 'rails_helper'

feature "New user can create an account" do
  context 'when they visit the login page' do
    before do
      visit '/'
      click_on "Login"
    end

    scenario "they see an option to create an account" do
      expect(current_path).to eq(login_path)
      expect(page).to have_link("Create an account")

      click_on "Create an account"
      expect(current_path).to eq(new_user_path)
    end

    scenario "they fill in user information" do
      click_on "Create an account"

      fill_in "user[first_name]", with: "Tester"
      fill_in "user[last_name]", with: "McTest"
      fill_in "user[email]", with: "test@testmail.com"
      fill_in "user[password]", with: "testing"
      fill_in "user[address]", with: "dummy address"

      click_on "Submit"

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content "Logged in as Tester McTest"
      expect(page).to have_content "test@testmail.com"

      expect(page).to_not have_link "Login"
      expect(page).to have_link "Logout"
    end

  end
end
