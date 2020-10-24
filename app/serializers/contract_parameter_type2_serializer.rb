class ContractParameterType2Serializer
  include JSONAPI::Serializer
  attributes :address

  belongs_to :contract, id_method_name: :cid
end
