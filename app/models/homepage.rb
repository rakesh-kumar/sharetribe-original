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
#  first_category_id                  :integer
#  second_category_id                 :integer
#  third_category_id                  :integer
#  fourth_category_id                 :integer
#  fifth_category_id                  :integer
#

class Homepage < ActiveRecord::Base

  has_attached_file :brand_image, styles: {
        :thumb => "1294x86#",
        :original => "#{APP_CONFIG.original_image_width}x#{APP_CONFIG.original_image_height}>"
      }
  has_attached_file :first_collage_image, styles: {
        :thumb => "360x275#",
        :original => "#{APP_CONFIG.original_image_width}x#{APP_CONFIG.original_image_height}>"
      }
  has_attached_file :second_collage_image, styles: {
        :thumb => "360x275#",
        :original => "#{APP_CONFIG.original_image_width}x#{APP_CONFIG.original_image_height}>"
      }
  has_attached_file :third_collage_image, styles: {
        :thumb => "360x275#",
        :original => "#{APP_CONFIG.original_image_width}x#{APP_CONFIG.original_image_height}>"
      }
  has_attached_file :fourth_collage_image, styles: {
        :thumb => "550x275#",
        :original => "#{APP_CONFIG.original_image_width}x#{APP_CONFIG.original_image_height}>"
      }
  has_attached_file :fifth_collage_image, styles: {
        :thumb => "550x275#",
        :original => "#{APP_CONFIG.original_image_width}x#{APP_CONFIG.original_image_height}>"
      }
  has_attached_file :sixth_collage_image, styles: {
        :thumb => "360x275#",
        :original => "#{APP_CONFIG.original_image_width}x#{APP_CONFIG.original_image_height}>"
      }
  has_attached_file :seventh_collage_image, styles: {
        :thumb => "360x275#",
        :original => "#{APP_CONFIG.original_image_width}x#{APP_CONFIG.original_image_height}>"
      }
  has_attached_file :eighth_collage_image, styles: {
        :thumb => "360x275#",
        :original => "#{APP_CONFIG.original_image_width}x#{APP_CONFIG.original_image_height}>"
      }
  has_attached_file :action_sec_image, styles: {
        :thumb => "635x355#",
        :original => "#{APP_CONFIG.original_image_width}x#{APP_CONFIG.original_image_height}>"
      }

  validates_attachment_content_type :brand_image, 
                                    :first_collage_image, 
                                    :second_collage_image, 
                                    :third_collage_image, 
                                    :fourth_collage_image, 
                                    :fifth_collage_image,
                                    :sixth_collage_image,
                                    :seventh_collage_image,
                                    :eighth_collage_image,
                                    :action_sec_image,
                                    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
