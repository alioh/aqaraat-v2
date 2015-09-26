class Bill < ActiveRecord::Base
  belongs_to :property_id
  belongs_to :user_id
  belongs_to :resident_id
end
