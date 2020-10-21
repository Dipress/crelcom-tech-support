module Api
  module V1
    class ContractsController < ApplicationController
      before_action :authorized

      def index
        @contracts = Contract.search(params)
        result = ContractSerializer.new(@contracts, include: [:inet_services]).serializable_hash
        render json: { contracts: result }
      end
    end
  end
end
