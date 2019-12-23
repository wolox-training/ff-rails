module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate
    end
  end
end
