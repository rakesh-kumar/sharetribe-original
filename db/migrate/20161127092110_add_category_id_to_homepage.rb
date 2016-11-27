class AddCategoryIdToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :first_category_id, :integer
    add_column :homepages, :second_category_id, :integer
    add_column :homepages, :third_category_id, :integer
    add_column :homepages, :fourth_category_id, :integer
    add_column :homepages, :fifth_category_id, :integer
  end
end
