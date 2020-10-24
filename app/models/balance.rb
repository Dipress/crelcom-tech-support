class Balance < ApplicationRecord
  self.table_name = 'contract_balance'

  belongs_to :contract, class_name: 'Contract', foreign_key: 'cid'

  private
    
    def self.by_cmy(cid, mm, yy)
      balance = Balance.where("cid='#{cid}' and mm='#{mm}' and yy='#{yy}'").limit(1)[0]
      if balance.nil?
        return "empty"
      else
        return sprintf('%.02f',(balance.summa1 + balance.summa2 - balance.summa3 - balance.summa4))
      end

    end
end
