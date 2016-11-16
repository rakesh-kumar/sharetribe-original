# == Schema Information
#
# Table name: homepages
#
#  id              :integer          not null, primary key
#  text_variation1 :string(255)
#  text_variation2 :string(255)
#  text_variation3 :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Homepage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
