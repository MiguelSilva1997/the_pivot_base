

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
    Store.create(name: "The Chill Store")
    Store.create(name: "Amazon")
    Store.create(name: "Etsy")
    Store.create(name: "The Yellow Bottle Store")
    Store.create(name: "Walmart")
  end
end

namespace :category do
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
end

namespace :roles do
  desc "create roles"
  task create_roles: :environment do
    Role.create(name: "The Chill Store")
    Store.create(name: "Amazon")
    Store.create(name: "Etsy")
    Store.create(name: "The Yellow Bottle Store")
    Store.create(name: "Walmart")
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
        url = item.title.parameterize
        item.update!(store_id: store.id, url: url)
      end
    end
    puts " All done now!"
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
        order.update!(store_id: store.id)
      end
    end
    puts " All done now!"
  end
end
