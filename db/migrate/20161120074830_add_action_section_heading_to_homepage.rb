class AddActionSectionHeadingToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :action_sec_heading, :string
  end
end
