class AddSixthOverlaySmallTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :sixth_overlay_small_texts, :string
  end
end
