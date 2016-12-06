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

class TransactionDetail < ActiveRecord::Base
  belongs_to :tx, class_name: 'Transaction', foreign_key: :transaction_id

  has_attached_file :image_one, :styles => {
                      :medium => "100x100#",
                      :original => "600x800>"}

  has_attached_file :image_two, :styles => {
                      :medium => "100x100#",
                      :original => "600x800>"}

  has_attached_file :image_three, :styles => {
                      :medium => "100x100#",
                      :original => "600x800>"}

  has_attached_file :image_four, :styles => {
                      :medium => "100x100#",
                      :original => "600x800>"}

  has_attached_file :image_five, :styles => {
                      :medium => "100x100#",
                      :original => "600x800>"}

  validates_attachment_content_type :image_one,
                                    :content_type => ["image/jpeg", "image/png", "image/gif",
                                      "image/pjpeg", "image/x-png"] #the two last types are sent by IE.
  validates_attachment_content_type :image_two,
                                    :content_type => ["image/jpeg", "image/png", "image/gif",
                                      "image/pjpeg", "image/x-png"] #the two last types are sent by IE.
  validates_attachment_content_type :image_three,
                                    :content_type => ["image/jpeg", "image/png", "image/gif",
                                      "image/pjpeg", "image/x-png"] #the two last types are sent by IE.
  validates_attachment_content_type :image_four,
                                    :content_type => ["image/jpeg", "image/png", "image/gif",
                                      "image/pjpeg", "image/x-png"] #the two last types are sent by IE.
  validates_attachment_content_type :image_five,
                                    :content_type => ["image/jpeg", "image/png", "image/gif",
                                      "image/pjpeg", "image/x-png"] #the two last types are sent by IE.

  
  def images
    all_images = []
    [image_one, image_two, image_three, image_four, image_five].each do |image|
      all_images << image if image.present?
    end
    all_images
  end

end
