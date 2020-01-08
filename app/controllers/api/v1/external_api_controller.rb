module Api
  module V1
    class ExternalApiController < ApiController
      def show
        external_api_book = api_request
        book = external_api_book['ISBN:' + isbn]
        return book_not_found if book.blank?

        book_info(book)
      end

      def book_info(book)
        render json: book
          .slice('title', 'subtitle', 'number_of_pages', 'authors')
          .merge(ISBN: isbn)
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
