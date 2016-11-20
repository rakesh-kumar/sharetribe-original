class AddFourthOverlaySmallTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :fourth_overlay_small_texts, :string
  end
end
