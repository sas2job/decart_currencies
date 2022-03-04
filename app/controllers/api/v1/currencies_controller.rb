module Api
  module V1
    class CurrenciesController < ApplicationController

      # CET /currencies
      def index
        currencies = Currency.page(page).per(per_page)
        render json: CurrencySerializer.render_as_hash(currencies, view: :normal)
      end

      private

      def page
        page ||= params[:page] || 1
      end

      def per_page
        per_page ||= params[:per_page] || 10
      end

    end
  end
end

