class Property < ActiveRecord::Base
  belongs_to :user

  has_one :resident
  has_many :bills

  validates :address , :city , :country
end
