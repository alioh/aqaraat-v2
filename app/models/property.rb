class Property < ActiveRecord::Base
  belongs_to :user

  has_one :resident
  has_many :bills

  validate :address , :city , :country
end
