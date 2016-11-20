class AddThirdSvgParagraphToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :third_svg_paragraph, :string
  end
end
