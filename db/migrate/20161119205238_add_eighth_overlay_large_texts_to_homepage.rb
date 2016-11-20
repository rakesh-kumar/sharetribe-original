class AddEighthOverlayLargeTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :eighth_overlay_large_texts, :string
  end
end
