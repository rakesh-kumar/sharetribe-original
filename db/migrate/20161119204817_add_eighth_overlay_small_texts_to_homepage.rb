class AddEighthOverlaySmallTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :eighth_overlay_small_texts, :string
  end
end
