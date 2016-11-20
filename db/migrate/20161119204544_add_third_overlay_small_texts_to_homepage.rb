class AddThirdOverlaySmallTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :third_overlay_small_texts, :string
  end
end
