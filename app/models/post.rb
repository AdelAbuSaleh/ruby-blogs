# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  is_public   :boolean          default(TRUE)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Post < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  has_rich_text :body
  has_one_attached :main_image
  has_many_attached :other_images
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  ## -------------------- Associations -------------------- ##
  belongs_to :category
  ## -------------------- Validations --------------------- ##
  validates :category, :title, presence: true
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
  def attach_other_images(signed_blob_id)
    blob = ActiveStorage::Blob.find_signed(signed_blob_id)
    return other_images.attach(signed_blob_id) unless blob.present?

    other_images.attach(blob.signed_id) unless other_images.attachments.map(&:blob_id).include?(blob.id)
  end
end
