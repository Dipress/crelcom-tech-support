class TariffPlan < ApplicationRecord
  self.table_name = 'tariff_plan'

  belongs_to :global_tariff, class_name: 'GlobalTariff'

  def self.tariff_title(tpid)
    tariff = TariffPlan.find(tpid)

    return tariff.title
  end
end
