class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :login, :name, :email, :descr, :pswd, :status, :gr, :domainIds
end
