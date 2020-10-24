class GlobalTariffSerializer
  include JSONAPI::Serializer
  attributes :name, :date1, :date2 

  belongs_to :contract, class_name: 'Contract', id_method_name: :cid  
end
