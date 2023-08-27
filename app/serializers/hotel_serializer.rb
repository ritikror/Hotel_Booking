class HotellSerializer < ActiveModel::Serializer
  attributes :id, :name, :contact, :address, :status
  
  belongs_to :location
  has_many :rooms

end
