# == Schema Information
#
# Table name: admin_users
#
#  id              :bigint           not null, primary key
#  country_code    :integer
#  email           :string
#  full_name_ar    :string
#  full_name_en    :string
#  mobile1         :string
#  mobile2         :string
#  mobile3         :string
#  password_digest :string           not null
#  user_name       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class AdminUser < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  has_secure_password
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  ## -------------------- Associations -------------------- ##
  ## -------------------- Validations --------------------- ##
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
end
