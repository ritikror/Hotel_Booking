class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age, :password, :mobile, :type
end
