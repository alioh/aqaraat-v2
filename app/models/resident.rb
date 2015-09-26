class Resident < ActiveRecord::Base
	belongs_to :user

	has_one :property
	has_many :bills

	validates_presence_of :name
end
