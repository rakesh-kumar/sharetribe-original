class AddThirdSvgHeadingToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :third_svg_heading, :string
  end
end
