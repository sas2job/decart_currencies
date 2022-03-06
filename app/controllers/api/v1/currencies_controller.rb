module Api
  module V1
    class CurrenciesController < ApplicationController
      # CET /currencies
      def index
        @currencies = Currency.page(page).per(per_page)
        render json: CurrencySerializer.render_as_hash(@currencies, view: :normal)
        set_pagination_headers(@currencies)
      end

      private

      def page
        page ||= params[:page] || 1
      end

      def per_page
        per_page ||= params[:per_page] || 10
      end

      def set_pagination_headers(cur_col)
        headers["X-Total-Count"] = cur_col.total_count

        links = []
        links << page_link(1, "first") unless cur_col.first_page?
        links << page_link(cur_col.prev_page, "prev") if cur_col.prev_page
        links << page_link(cur_col.next_page, "next") if cur_col.next_page
        links << page_link(cur_col.total_pages, "last") unless cur_col.last_page?
        headers["Link"] = links.join(", ") if links.present?
      end

      def page_link(page, rel)
        base_url = request.url.split("?").first
        "<#{base_url}?#{request.query_parameters.merge(page: page).to_param}>; rel='#{rel}'"
      end
    end
  end
end

