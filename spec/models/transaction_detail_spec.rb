# == Schema Information
#
# Table name: transaction_details
#
#  id                       :integer          not null, primary key
#  product_name             :string(255)
#  description              :text(65535)
#  recommended_retail_price :decimal(10, )
#  wholesale_price          :decimal(10, )
#  image_one_file_name      :string(255)
#  image_one_content_type   :string(255)
#  image_one_file_size      :integer
#  image_one_updated_at     :datetime
#  image_two_file_name      :string(255)
#  image_two_content_type   :string(255)
#  image_two_file_size      :integer
#  image_two_updated_at     :datetime
#  image_three_file_name    :string(255)
#  image_three_content_type :string(255)
#  image_three_file_size    :integer
#  image_three_updated_at   :datetime
#  image_four_file_name     :string(255)
#  image_four_content_type  :string(255)
#  image_four_file_size     :integer
#  image_four_updated_at    :datetime
#  image_five_file_name     :string(255)
#  image_five_content_type  :string(255)
#  image_five_file_size     :integer
#  image_five_updated_at    :datetime
#  transaction_id           :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'rails_helper'

RSpec.describe TransactionDetail, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
