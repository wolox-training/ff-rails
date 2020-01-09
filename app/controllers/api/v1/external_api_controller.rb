module Api
  module V1
    class ExternalApiController < ApiController
      def show
        book = search_book
        return book_not_found if book.blank?

        render json: book
      end

      def search_book
        search = api_request['ISBN:' + isbn]
        search
          .slice('title', 'subtitle', 'number_of_pages', 'authors')
          .merge(ISBN: isbn) unless search.blank?
      end

      def book_not_found
        render json: { message: 'Book not found' }, status: :not_found
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
