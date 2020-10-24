class InetConnectionSerializer
  include JSONAPI::Serializer
  attributes :human_ip, :mac_address, :status_text 
  belongs_to :inet_service, id_method_name: :servId
end
