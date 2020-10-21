class InetService < ApplicationRecord
  self.table_name  = 'inet_serv_1'
  self.primary_key = 'id'

  belongs_to :contract, class_name: 'Contract', foreign_key: 'contractId'
end
