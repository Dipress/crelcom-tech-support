module Api
  module V1
    class ContractsController < ApplicationController
      before_action :authorized

      def index
        contracts_by_user = Contract.where(domainId: current_user.domainIds.split(',').map(&:to_i))
        @contracts = Contract.search(contracts_by_user, params)
        result = ContractSerializer.new(@contracts, options).serializable_hash
        render json: result
      end

      private

        def options
          @options ||= { is_collection: true, include: ['inet_services', 'inet_services.inet_connection', 'contract_parameter_type2', 'global_tariffs'] }
        end
    end
  end
end
