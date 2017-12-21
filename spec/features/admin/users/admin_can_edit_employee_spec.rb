require 'rails_helper'

describe "when an admin clicks on edit employee and fills out the form" do
  before(:each) do
    @platform_admin = create(:platform_admin, first_name: 'Miguel', role: 'platform_admin')
    @store_admin = create(:store_admin, email: "123")
    create(:role, name: "store_manager")
  end
  it "can edit an employee" do
    login_user(@platform_admin.email, @platform_admin.password)

    visit admin_store_path(@store_admin.stores.first.url)

    click_on "Edit Employee Privileges"

    select('store_manager', :from => 'store_user[role_id]')
    click_on "Update Store user"

    expect(page).to have_content('Store Manager')
  end
end
