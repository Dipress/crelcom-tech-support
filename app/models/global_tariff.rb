class GlobalTariff < ApplicationRecord
  self.table_name  = 'contract_tariff'
  self.primary_key = 'tpid'

  belongs_to :contract, class_name: 'Contract', foreign_key: 'cid'
  has_one :tariff_plan, class_name: 'TariffPlan', foreign_key: 'id'

  def name
    TariffPlan.tariff_title(self.tpid)
  end
end
