class AddFourthOverlayLargeTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :fourth_overlay_large_texts, :string
  end
end
