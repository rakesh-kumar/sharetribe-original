class AddThirdOverlayLargeTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :third_overlay_large_texts, :string
  end
end
