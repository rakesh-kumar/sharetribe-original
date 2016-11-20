class AddSeventhOverlaySmallTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :seventh_overlay_small_texts, :string
  end
end
