module Api
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate

      before_action :authenticate_user!

      def index
        render_paginated @current_user.rents, each_serializer: RentSerializer
      end

      def create
        @rent = Rent.create(rent_params)
        if @rent.save
          render json: @rent, status: :created
        else
          render json: { message: 'Cannot create rent, invalid data' }, status: :bad_request
        end
      end

      private

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :start_date, :end_date)
      end
    end
  end
end
