module Api
  module V1
    class CurrenciesController < ApplicationController

      # CET /currencies
      def index
        currencies = Currency.all
        render json: CurrencySerializer.render_as_hash(currencies, view: :normal)
      end
    
    end
  end
end

