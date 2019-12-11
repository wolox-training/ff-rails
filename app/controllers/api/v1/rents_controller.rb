module Api
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate

      before_action :authenticate_user!

      def index
        render_paginated Rent.where(user_id: )
      end

      def create
        @rent = Rent.create(rent_params)
      end

      private

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :start_date, :end_date)
      end
    end
  end
end
