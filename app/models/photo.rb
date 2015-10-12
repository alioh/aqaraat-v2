class Photo < ActiveRecord::Base
  belongs_to :property
  belongs_to :bill
  belongs_to :resident

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image,  content_type: /\Aimage\/.*\Z/
end
