class ContractParameterType2 < ApplicationRecord
  self.table_name  = 'contract_parameter_type_2'
  self.primary_key = 'pid'

  belongs_to :contract, class_name: 'Contract', foreign_key: 'cid'
end
