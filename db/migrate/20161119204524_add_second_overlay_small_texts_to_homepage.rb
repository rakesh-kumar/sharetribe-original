class AddSecondOverlaySmallTextsToHomepage < ActiveRecord::Migration
  def change
    add_column :homepages, :second_overlay_small_texts, :string
  end
end
