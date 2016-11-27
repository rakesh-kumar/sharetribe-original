class AddCategoryIdToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :first_collage_url, :string
    add_column :homepages, :second_collage_url, :string
    add_column :homepages, :third_collage_url, :string
    add_column :homepages, :fourth_collage_url, :string
    add_column :homepages, :fifth_collage_url, :string
    add_column :homepages, :sixth_collage_url, :string
    add_column :homepages, :seventh_collage_url, :string
    add_column :homepages, :eighth_collage_url, :string
  end
end
