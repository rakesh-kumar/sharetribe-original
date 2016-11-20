class AddActionSecImageToHomepage < ActiveRecord::Migration
  def change
  	add_attachment :homepages, :action_sec_image
  end
end
