

  namespace :import_dump do
    desc "Load pre-generated PG data into Dev db"
    task :load => ["db:drop", "db:create"] do
      load_cmd = "psql -d the_pivot_development -f #{Rails.root.join("backup.sql")}"
      puts "will load Data dump into local PG database with command:"
      puts load_cmd
      system(load_cmd)
    end
  end

  namespace :stores do
    desc "create stores"
    task create_store: :environment do
      Store.create(name: "Amazon")
      Store.create(name: "Books-a-Million")
      Store.create(name: "Barnes and Noble")
      Store.create(name: "Tattered Cover")
      Store.create(name: "2nd and Charles")
    end
  end

  namespace :roles do
    desc "create roles"
    task create_role: :environment do
      Role.create(name: "platform_admin")
      Role.create(name: "store_admin")
      Role.create(name: "store_manager")
    end
  end

  namespace :categories do
    desc "Update existing category URL names"
    task update_category: :environment do
      categories = Category.all
      puts "Going to update #{categories.count} categories"

      ActiveRecord::Base.transaction do
        categories.each do |category|

          url = category.title.parameterize
          category.update!(url: url)
        end
      end
      puts " All done now!"
    end
    task add_category: :environment do
      Category.create(title: "Fantasy")
      Category.create(title: "Science Fiction")
      Category.create(title: "Animals")
      Category.create(title: "Children")
      Category.create(title: "Computer Science")
      Category.create(title: "Cooking")
      Category.create(title: "Self Help")
      Category.create(title: "Psychology")
      Category.create(title: "Mystery")
      Category.create(title: "Romance")
    end
  end

  namespace :items do
    desc "Update existing items with stores"
    task update_item: :environment do
      items = Item.all
      puts "Going to update #{items.count} items"


      ActiveRecord::Base.transaction do
        items.each do |item|

          store = Store.all.sample
          category = Category.all.sample
          url = item.title.parameterize
          item.update!(store_id: store.id, url: url, category_id: category.id)
        end
      end
      puts " All done now!"
    end
  end

  namespace :users do
    desc "Add users"
    task add_user: :environment do
      User.create!(first_name: "Josh", last_name: "Smith", email: "josh@turing.io", password: "password", address: "123 Josh St.")
      User.create!(first_name: "Ian", last_name: "Jones", email: "ian@turing.io", password: "password", address: "123 Ian St.")
      User.create!(first_name: "Cory", last_name: "West", email: "cory@turing.io", password: "password", address: "123 Cory St.", role: 1)
      User.create!(first_name: "Aurora", last_name: "Doe", email: "aurora@turing.io", password: "password", address: "123 Aurora St.")
      User.create!(first_name: "Emily", last_name: "Smart", email: "emily@turing.io", password: "password", address: "123 Emily St.")
    end
  end

  namespace :store_users do
    desc "Add store users"
    task add_store_user: :environment do
      josh = User.find_by(email: "josh@turing.io")
      ian = User.find_by(email: "ian@turing.io")
      cory = User.find_by(email: "cory@turing.io")
      platform_admin_role = Role.find_by(name: "platform_admin")
      store_admin_role = Role.find_by(name: "store_admin")
      store_manager_role = Role.find_by(name: "store_manager")

      ActiveRecord::Base.transaction do
        stores = Store.all
        stores.each do |store|
          StoreUser.create(user_id: josh.id, store_id: store.id, role: store_manager_role)
          StoreUser.create(user_id: ian.id, store_id: store.id, role: store_admin_role)
          StoreUser.create(user_id: cory.id, store_id: store.id, role: platform_admin_role)
        end
      end
    end
  end

  namespace :orders do
    desc "Update existing orders with stores"
    task update_order: :environment do
      orders = Order.all
      puts "Going to update #{orders.count} orders"


      ActiveRecord::Base.transaction do
        orders.each do |order|
          store = Store.all.sample
          user = User.all.sample
          order.update!(store_id: store.id, user_id: user.id)
        end
      end
      puts " All done now!"
    end
  end
