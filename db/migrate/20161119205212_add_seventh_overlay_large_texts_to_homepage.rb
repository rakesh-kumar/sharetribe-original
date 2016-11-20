class AddSeventhOverlayLargeTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :seventh_overlay_large_texts, :string
  end
end
