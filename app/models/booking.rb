class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :hotel

  validates :customer_name, presence:true
  validates :mobile, presence: true, format: {with: /\A\d{10}\z/, message:"Should be 10 Digit!!"}
  validates :room_type, presence: true
  validates :member, numericality: { only_integer: true }
  validates :room_type, presence: true, inclusion: {in: %w(normal deluxe)}
  validate :one_user_cant_book_room_again

  private
  def one_user_cant_book_room_again
    if user.bookings.exists?(room_id: room_id)
      errors.add(:base, "You have booked this room already")
    end
  end

end
