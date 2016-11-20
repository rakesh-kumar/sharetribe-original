class AddSecondCollageImageToHomepage < ActiveRecord::Migration
  def change
  	add_attachment :homepages, :second_collage_image
  	add_attachment :homepages, :third_collage_image
  	add_attachment :homepages, :fourth_collage_image
  	add_attachment :homepages, :fifth_collage_image
  	add_attachment :homepages, :sixth_collage_image
  	add_attachment :homepages, :seventh_collage_image
  	add_attachment :homepages, :eighth_collage_image
  end
end
