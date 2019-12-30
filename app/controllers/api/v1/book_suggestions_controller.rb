module Api
  module V1
    class BookSuggestionsController < ApiController
      def create
        @book_suggestion = BookSuggestion.create(suggestion_params)
        if current_user
          @book_suggestion.user_id = current_user.id
        end
        if @book_suggestion.save
          render json: @book_suggestion, status: :created
        else
          render json: { message: 'Cannot save that suggestion, invalid data' }, status: :bad_request
        end
      end

      private

      def suggestion_params
        params.require(:book_suggestion).permit(:user_id, :author, :title, :editor, :year, :link)
      end
    end
  end
end
