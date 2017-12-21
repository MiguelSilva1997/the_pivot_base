require 'rails_helper'

feature 'a registered user applies to create a new store' do
  let(:user) {create(:user)}

  it "they see a link to create a new store" do
    login_user(user.email, user.password)
    visit dashboard_index_path

    expect(page).to have_link("New Store Application")
  end

  it "they see a form to create a new store" do
    login_user(user.email, user.password)
    visit dashboard_index_path
    click_on("New Store Application")

    expect(current_path).to eq(new_store_path)
    expect(page).to have_button("Create Application")
  end

  it "they can create an application for a new business" do
    login_user(user.email, user.password)
    visit dashboard_index_path
    click_on("New Store Application")
    fill_in 'store[name]', with: 'The Banana Stand'
    click_on "Create Application"

    expect(page).to have_content("You have successfully submitted an application for The Banana Stand!")
  end

  it "they automatically become the administrator for that store" do
    stub_login(user)
    platform_admin = create(:platform_admin)
    visit new_store_path
    fill_in 'store[name]', with: 'The Banana Stand'
    click_on "Create Application"
    
    expect(Store.last.store_users.first.user).to eq(user)
    expect(Store.last.store_users.last.user).to eq(platform_admin)

  end
end
