module Api
  module V1
    class ExternalApiController < ApiController
      def show
        external_api_book = api_request
        book = external_api_book['ISBN:' + isbn]
        render json: book
          .slice('title', 'subtitle', 'number_of_pages', 'authors')
          .merge(ISBN: isbn) if book.present?
      end

      def api_request
        ExternalApiService.api_request(isbn)
      end

      def isbn
        params.require(:isbn)
      end
    end
  end
end
