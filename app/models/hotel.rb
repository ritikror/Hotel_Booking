class Hotel < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :bookings

  has_many :rooms, dependent: :destroy
  
  validates :name, presence: true 
  validates :address, :contact, presence: true
  validates :status ,presence:true, inclusion: { in: %w(open closed) } 
  validate :owner_only_add_hotel

  private
  def owner_only_add_hotel
    unless user.type == "Owner"
      errors.add(:base, "Only Owner have permission to add hotels.")      
    end
  end
end
