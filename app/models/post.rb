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
end
