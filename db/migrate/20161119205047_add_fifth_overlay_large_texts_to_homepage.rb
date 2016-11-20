class AddFifthOverlayLargeTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :fifth_overlay_large_texts, :string
  end
end
