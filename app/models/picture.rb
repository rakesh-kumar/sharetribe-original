class Picture < ActiveRecord::Base
	belongs_to :pictureable, polymorphic: true
	mount_base64_uploader :image, ImageUploader
end
