class AddSixthOverlayLargeTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :sixth_overlay_large_texts, :string
  end
end
