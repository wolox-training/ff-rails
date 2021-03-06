module Api
  module V1
    class RentsController < ApiController
      def index
        render_paginated policy_scope(Rent), each_serializer: RentSerializer
      end

      def create
        @rent = Rent.create(rent_params)
        authorize @rent
        if @rent.save
          RentsMailer.with(rent_id: @rent.id).creation_email.deliver_later
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
