class Bill < ActiveRecord::Base
  belongs_to :property
  belongs_to :user
  belongs_to :resident
  has_many :photos
end
