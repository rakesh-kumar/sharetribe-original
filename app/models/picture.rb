# == Schema Information
#
# Table name: pictures
#
#  id               :integer          not null, primary key
#  pictureable_id   :string(255)
#  pictureable_type :string(255)
#  image            :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Picture < ActiveRecord::Base
	belongs_to :pictureable, polymorphic: true
	mount_base64_uploader :image, ImageUploader
end
