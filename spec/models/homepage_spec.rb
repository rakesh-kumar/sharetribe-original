# == Schema Information
#
# Table name: homepages
#
#  id                                 :integer          not null, primary key
#  text_variation1                    :string(255)
#  text_variation2                    :string(255)
#  text_variation3                    :string(255)
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#  brand_image_file_name              :string(255)
#  brand_image_content_type           :string(255)
#  brand_image_file_size              :integer
#  brand_image_updated_at             :datetime
#  heading                            :string(255)
#  first_svg_heading                  :string(255)
#  first_svg_paragraph                :string(255)
#  second_svg_heading                 :string(255)
#  third_svg_heading                  :string(255)
#  second_svg_paragraph               :string(255)
#  third_svg_paragraph                :string(255)
#  collage_section_title              :string(255)
#  first_overlay_small_texts          :string(255)
#  second_overlay_small_texts         :string(255)
#  third_overlay_small_texts          :string(255)
#  fourth_overlay_small_texts         :string(255)
#  fifth_overlay_small_texts          :string(255)
#  sixth_overlay_small_texts          :string(255)
#  seventh_overlay_small_texts        :string(255)
#  eighth_overlay_small_texts         :string(255)
#  first_overlay_large_texts          :string(255)
#  second_overlay_large_texts         :string(255)
#  third_overlay_large_texts          :string(255)
#  fourth_overlay_large_texts         :string(255)
#  fifth_overlay_large_texts          :string(255)
#  sixth_overlay_large_texts          :string(255)
#  seventh_overlay_large_texts        :string(255)
#  eighth_overlay_large_texts         :string(255)
#  first_collage_image_file_name      :string(255)
#  first_collage_image_content_type   :string(255)
#  first_collage_image_file_size      :integer
#  first_collage_image_updated_at     :datetime
#  second_collage_image_file_name     :string(255)
#  second_collage_image_content_type  :string(255)
#  second_collage_image_file_size     :integer
#  second_collage_image_updated_at    :datetime
#  third_collage_image_file_name      :string(255)
#  third_collage_image_content_type   :string(255)
#  third_collage_image_file_size      :integer
#  third_collage_image_updated_at     :datetime
#  fourth_collage_image_file_name     :string(255)
#  fourth_collage_image_content_type  :string(255)
#  fourth_collage_image_file_size     :integer
#  fourth_collage_image_updated_at    :datetime
#  fifth_collage_image_file_name      :string(255)
#  fifth_collage_image_content_type   :string(255)
#  fifth_collage_image_file_size      :integer
#  fifth_collage_image_updated_at     :datetime
#  sixth_collage_image_file_name      :string(255)
#  sixth_collage_image_content_type   :string(255)
#  sixth_collage_image_file_size      :integer
#  sixth_collage_image_updated_at     :datetime
#  seventh_collage_image_file_name    :string(255)
#  seventh_collage_image_content_type :string(255)
#  seventh_collage_image_file_size    :integer
#  seventh_collage_image_updated_at   :datetime
#  eighth_collage_image_file_name     :string(255)
#  eighth_collage_image_content_type  :string(255)
#  eighth_collage_image_file_size     :integer
#  eighth_collage_image_updated_at    :datetime
#  action_sec_image_file_name         :string(255)
#  action_sec_image_content_type      :string(255)
#  action_sec_image_file_size         :integer
#  action_sec_image_updated_at        :datetime
#  action_sec_heading                 :string(255)
#  action_sec_para                    :string(255)
#  video_url                          :string(255)
#  first_collage_url                  :string(255)
#  second_collage_url                 :string(255)
#  third_collage_url                  :string(255)
#  fourth_collage_url                 :string(255)
#  fifth_collage_url                  :string(255)
#  sixth_collage_url                  :string(255)
#  seventh_collage_url                :string(255)
#  eighth_collage_url                 :string(255)
#

require 'rails_helper'

RSpec.describe Homepage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
