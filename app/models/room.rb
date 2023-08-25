class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, dependent: :destroy

  validates :room_number, presence: true, numericality: { only_integer: true }, uniqueness: true
  validates :room_category, presence: true, inclusion: {in: %w(normal deluxe)} 
  validates :status, presence: true, inclusion: {in: %w(available unavailable)} 
  validates :occupency, numericality: { only_integer: true, less_than_or_equal_to: 2 }
end
