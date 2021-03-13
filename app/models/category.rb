# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name_ar    :string
#  name_en    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  has_rich_text :body
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  ## -------------------- Associations -------------------- ##
  has_many :posts
  ## -------------------- Validations --------------------- ##
  validates :name_ar, :name_en, presence: true
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ## 
end
