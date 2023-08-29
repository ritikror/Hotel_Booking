class User < ApplicationRecord
	has_many :hotels, dependent: :destroy
	has_many :bookings, dependent: :destroy
	has_secure_password
	
	validates :name, :type, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message:"Invalid email id!!!!" }
 	validates :mobile, presence: true, format: {with: /\A\d{10}\z/, message:"Should be 10 Digit!!"}

end