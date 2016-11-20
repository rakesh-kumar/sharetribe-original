class AddBrandImageToHomepage < ActiveRecord::Migration
  def change
  	  add_attachment :homepages, :brand_image
  end
end
