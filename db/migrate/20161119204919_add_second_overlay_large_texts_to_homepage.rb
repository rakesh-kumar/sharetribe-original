class AddSecondOverlayLargeTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :second_overlay_large_texts, :string
  end
end
