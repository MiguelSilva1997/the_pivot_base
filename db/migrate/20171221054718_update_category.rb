class UpdateCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :url, :string
    remove_column :categories, :slug, :string

  end
end
