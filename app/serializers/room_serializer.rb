class RoomSerializer < ActiveModel::Serializer
  attributes :id, :room_number, :occupency, :status, :room_category, :hotel

  def hotel
    object.hotel.name
  end
end
