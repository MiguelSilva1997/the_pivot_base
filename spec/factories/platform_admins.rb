FactoryBot.define do
  factory :platform_admin, class: User do
    first_name "Gob"
    last_name "Bluth"
    password "password"
    sequence(:email) {|n| "gob#{n}@example.com" }
    role 1

    factory :platform_admin_with_store_order, class: User do
      after(:create) do |user|
        role = create(:role, name: "platform_admin")
        store = create(:store_with_order)
        create(:store_user, user: user, role: role, store: store)
      end
    end

    factory :platform_admin_with_store_items, class: User do
      after(:create) do |user|
        role = create(:role, name: "platform_admin")
        store = create(:store_with_items)
        create(:store_user, user: user, role: role, store: store)
      end
    end

    factory :platform_admin_with_store_item, class: User do
      after(:create) do |user|
        role = create(:role, name: "platform_admin")
        store = create(:store_with_item)
        create(:store_user, user: user, role: role, store: store)
      end
    end

  end
end
