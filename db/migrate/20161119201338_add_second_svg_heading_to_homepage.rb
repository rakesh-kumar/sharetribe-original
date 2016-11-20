class AddSecondSvgHeadingToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :second_svg_heading, :string
  end
end
