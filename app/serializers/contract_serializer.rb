class ContractSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :pswd, :comment, :status 
end
