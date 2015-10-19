class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable , :validatable, :confirmable

  validates :fullname, presence: true, length: {maximum: 50}
  validates :email, presence: true

	has_many :bills
  has_many :residents
  has_many :properties
end
