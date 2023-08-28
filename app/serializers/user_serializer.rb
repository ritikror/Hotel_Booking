class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age, :mobile, :type
end
