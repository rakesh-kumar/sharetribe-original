class AddFirstSvgParagraphToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :first_svg_paragraph, :string
  end
end
