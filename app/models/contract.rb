class Contract < ApplicationRecord
  self.table_name  = "contract"
  self.primary_key = "id"

  has_many :inet_services, class_name: 'InetService', foreign_key: 'contractId'

  def self.search(search)
    if search
        contracts = Contract.all #current_user.domainIds.split(',').map(&:to_i)       

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
end

