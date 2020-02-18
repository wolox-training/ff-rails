module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :authenticate_user!
      def create
        book_suggestion = BookSuggestion.create(suggestion_params)
        book_suggestion.user_id = current_user.id if current_user
        if book_suggestion.save
          render json: book_suggestion, status: :created
        else
          render json: { message: 'Cannot save that suggestion' }, status: :bad_request
        end
      end

      private

      def suggestion_params
        params.require(:book_suggestion)
              .permit(:author, :title, :editor, :year, :link, :synopsis, :price)
      end
    end
  end
end
