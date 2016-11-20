class AddFirstOverlayLargeTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :first_overlay_large_texts, :string
  end
end
