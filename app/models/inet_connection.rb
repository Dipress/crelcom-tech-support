class InetConnection < ApplicationRecord
  self.table_name  = 'inet_connection_1'
  self.primary_key = 'id'
  self.inheritance_column = :_type_disabled

  belongs_to :inet_service, class_name: 'InetService', foreign_key: 'servId'

  def human_ip
    ipAddress.bytes.to_a.join('.')
  end

   def mac_address
     callingStationId.strip!
   end

   def status_text
     case status
     when 0
       "wait"
     when 1
       "alive"
     when 2
       "suspended"
     when 3
       "closed"
     when 4
       "finished"
     else
       "undefined"
     end
   end
end
