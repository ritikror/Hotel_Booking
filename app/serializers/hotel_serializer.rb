class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :contact, :address, :status

end
