class ContractSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :pswd, :comment, :current_balance, :limit, :status 

  has_many :inet_services, class_name: 'InetService', foreign_key: 'contractId'
  has_many :contract_parameter_type2, class_name: 'ContractParameterType2', foreign_key: 'cid'
  has_many :global_tariffs, class_name: 'GlobalTariff', foreign_key: 'cid'
end
