module Api
  module V1
    class OpenLibraryController < ApiController
      def show
        book = search_book
        return book_not_found if book.blank?

        render json: book
      end

      private

      def search_book
        search = api_request['ISBN:' + isbn]
        return if search.blank?

        search
          .slice('title', 'subtitle', 'number_of_pages', 'authors')
          .merge(ISBN: isbn), status: :ok
      end

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
