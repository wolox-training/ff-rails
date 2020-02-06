module Api
  module V1
    class OpenLibraryController < ApiController
      def show
        book = api_request
        return book_not_found if book.blank?

        render json: book, status: :ok
      end

      private

      def book_not_found
        render json: { message: 'Book not found' }, status: :not_found
      end

      def api_request
        OpenLibraryService.new.api_request(isbn)
      end

      def isbn
        params.require(:isbn)
      end
    end
  end
end
