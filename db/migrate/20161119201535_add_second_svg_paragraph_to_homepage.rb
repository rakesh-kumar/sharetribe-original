class AddSecondSvgParagraphToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :second_svg_paragraph, :string
  end
end
