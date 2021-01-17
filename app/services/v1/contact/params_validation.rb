module V1::Contact
  class ParamsValidation
    include ActiveModel::Model       # make it a model
    include ActiveModel::Validations # add validations

    attr_accessor :name, :email, :message

    validates :name, :email, :message, presence: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  end
end
