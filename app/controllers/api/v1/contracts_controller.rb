module Api
  module V1
    class ContractsController < ApplicationController
      before_action :authorized

      def index
        @contracts = Contract.where(domainId: current_user.domainIds.split(',').map(&:to_i))       
        result = ContractSerializer.new(@contracts).serializable_hash
        render json: { contracts: result }
      end

      def search(search)
      end

    end
  end
end
