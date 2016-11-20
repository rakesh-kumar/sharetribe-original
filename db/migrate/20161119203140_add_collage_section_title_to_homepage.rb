class AddCollageSectionTitleToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :collage_section_title, :string
  end
end
