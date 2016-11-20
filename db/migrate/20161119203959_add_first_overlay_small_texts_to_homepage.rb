class AddFirstOverlaySmallTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :first_overlay_small_texts, :string
  end
end
