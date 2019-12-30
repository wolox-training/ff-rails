module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate
      before_action :authenticate_user!, only: [:books, :rents]
    end
  end
end
