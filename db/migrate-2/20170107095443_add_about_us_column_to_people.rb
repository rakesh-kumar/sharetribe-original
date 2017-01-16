class AddAboutUsColumnToPeople < ActiveRecord::Migration
  def change
    add_column :people, :about_us, :text
  end
end
