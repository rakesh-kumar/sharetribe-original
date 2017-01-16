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

require 'rails_helper'

RSpec.describe Picture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
