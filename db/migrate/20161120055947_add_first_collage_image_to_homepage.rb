class AddFirstCollageImageToHomepage < ActiveRecord::Migration
  def change
  	add_attachment :homepages, :first_collage_image
  end
end
