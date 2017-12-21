class RemoveSlugFromCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :slug
    rename_column :items, :condition, :status
  end
end
