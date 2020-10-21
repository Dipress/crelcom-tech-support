class ContractSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :pswd, :comment, :status 

  # has_many :inet_services
  has_many :inet_services, class_name: 'InetService', foreign_key: 'contractId'
end
