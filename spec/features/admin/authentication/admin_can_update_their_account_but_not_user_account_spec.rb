require "rails_helper"

describe "As a logged in Store Admin" do
  let(:admin) {create(:store_admin)}

  before do
    login_user(admin.email, admin.password)
    click_on "My Account"
  end

  it "I can see my personal account information" do

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("Edit Account")
  end

  it "I can modify my account info" do
    click_on "Edit Account"

    expect(current_path).to eq(account_edit_path)

    fill_in "user[email]", with: "kramer@example.com"
    fill_in "user[password]", with: "cosmo"
    click_on "Update Account Information"
    click_on "Logout"

    login_user("kramer@example.com", "cosmo")
    click_on "My Account"

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("kramer@example.com")
  end

end
