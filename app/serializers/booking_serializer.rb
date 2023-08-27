class BookingSerializer < ActiveModel::Serializer
  attributes :id, :room_number, :customer_name, :mobile, :member, :hotel

  def room_number
    object.room.room_number
  end

  def hotel
    object.room.hotel.name
  end
end
