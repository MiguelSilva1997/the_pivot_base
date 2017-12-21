require 'rails_helper'

describe "when an admin clicks on add new emplyee and fills out the form" do
  before(:each) do
    @platform_admin = create(:platform_admin_with_store_item)
    @user = create(:user, first_name: "lola", email: "lola")
  end
  it "creates a new emplyee and it shows in the dashboard" do
    login_user(@platform_admin.email, @platform_admin.password)

    visit admin_store_path(@platform_admin.stores.first.url)

    click_on "Add New Store Employee"

    fill_in ('store_user[user_id]'), with: "lola"
    select('platform_admin', :from => 'store_user[role_id]')
    click_on "Create Store user"

    expect(page).to have_content('lola')
  end
end
