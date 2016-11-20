class AddFirstSvgHeadingToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :first_svg_heading, :string
  end
end
