class AddFifthOverlaySmallTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :fifth_overlay_small_texts, :string
  end
end
