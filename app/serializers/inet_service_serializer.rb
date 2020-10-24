class InetServiceSerializer
  include JSONAPI::Serializer
  attributes :login, :password

  belongs_to :contract, id_method_name: :contractId
  has_one :inet_connection
end
