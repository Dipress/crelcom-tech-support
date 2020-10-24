class Contract < ApplicationRecord
  self.table_name  = "contract"
  self.primary_key = "id"

  has_many :inet_services, class_name: 'InetService', foreign_key: 'contractId'
  has_many :balances, class_name: 'Balace', foreign_key: 'cid'
  has_many :contract_parameter_type2, class_name: 'ContractParameterType2', foreign_key: 'cid'
  has_many :global_tariffs, class_name: 'GlobalTariff', foreign_key: 'cid'

  def self.search(contracts, search)
    if search
        if search[:title].present?
          contracts = contracts.where(title: search[:title])
        end

        if search[:fio].present?
          contracts = contracts.where(["comment LIKE ?", "%#{search[:fio]}%"])
        end

        if search[:login].present?
          contracts = contracts.joins(:inet_services).where(inet_serv_1: {login: search[:login]})
        end

        return contracts
    end
  end

  def limit
    self.closesumma
  end

  def current_balance
    Balance.by_cmy(self.id, Time.now.month, Time.now.year)
  end
end

