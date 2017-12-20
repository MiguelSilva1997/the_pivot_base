 require 'rails_helper'

RSpec.describe "As a registered user" do
  let(:user) { create(:user)  }

	 it "I can log in" do
     visit root_path
  	 click_on 'Login'

     expect(current_path).to eq(login_path)

  	 fill_in "session[email]", with: "#{user.email}"
  	 fill_in "session[password]", with: "#{user.password}"

     within(".action") do
  		click_on("Login")

      expect(current_path).to eq(dashboard_index_path)
     end
   end

  it "I can log out" do
    login_user(user.email, user.password)
		click_on 'Logout'

    expect(current_path).to eq(root_path)
		expect(page).to have_content("Login")
	end

end
