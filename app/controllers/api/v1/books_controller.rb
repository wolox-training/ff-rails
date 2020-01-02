module Api
  module V1
    class BooksController < ApiController
      def index
        render_paginated Book.all, each_serializer: BookSerializer
      end

      def show
        render json: Book.find(params[:id])
      end
    end
  end
end
