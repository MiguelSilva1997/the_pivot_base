require "rails_helper"

describe "validations" do
  context "invalid attributes" do

    it "is invalid without a first name" do
      user = build(:user, first_name: nil)
      expect(user).to be_invalid
    end

    it "is invalid without a last name" do
      user = build(:user, last_name: nil)
      expect(user).to be_invalid
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      expect(user).to be_invalid
    end

    it "is invalid without an e-mail" do
      user = build(:user, email: nil)
      expect(user).to be_invalid
    end

    it "is invalid without a unique e-mail" do
      create(:user, email: "gob@example.com")
      user_2 = build(:user, email: "gob@example.com")
      expect(user_2).to be_invalid
    end
  end

  describe 'relationships' do
    it 'has many roles' do
      user = build(:user)
      expect(user).to respond_to(:roles)
    end

      it 'has many stores' do
        user = build(:user)
        expect(user).to respond_to(:stores)
      end

      it 'has many stores_users' do
        user = build(:user)
        expect(user).to respond_to(:store_users)
      end

  context "instance methods" do
    it "can return user's full name" do
      user = User.new(first_name: "McTest",last_name: "McTest", password: "testing", email: "tester@testmail")
      expect(user.full_name).to eq("McTest McTest")
    end

    it "can return the date a user joined" do
      user = User.create(first_name: "McTest",last_name: "McTest", password: "testing", email: "tester@testmail", created_at: "2017-09-13 01:13:04 -0600")
      expect(user.date_joined).to eq("Sep. 13, 2017")
    end

    it "can check if store_manager" do
      user = User.create(first_name: "McTest",last_name: "McTest", password: "testing", email: "tester@testmail", created_at: "2017-09-13 01:13:04 -0600")
      role = create(:role, name: "store_manager")
      store = create(:store)
      create(:store_user, user: user, role: role, store: store)
      expect(user.store_manager?).to eq(true)

    end

    it "can check if store_admin" do
      user = User.create(first_name: "McTest",last_name: "McTest", password: "testing", email: "tester@testmail", created_at: "2017-09-13 01:13:04 -0600")
      role = create(:role, name: "store_admin")
      store = create(:store)
      create(:store_user, user: user, role: role, store: store)
      expect(user.store_admin?).to eq(true)
    end

    it "can check if platform_admin" do
      user = User.create(first_name: "McTest",last_name: "McTest", password: "testing", email: "tester@testmail", created_at: "2017-09-13 01:13:04 -0600", role: 1)

      expect(user.role).to eq('platform_admin')
    end
  end
end
end
