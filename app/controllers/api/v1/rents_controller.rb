module Api
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate

      before_action :authenticate_user!

      def index
        render_paginated Rent.all
      end

      def create
        @rent = Rent.new(params)
      end
    end
  end
end
