class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  def not_found_error
    render json: { message: 'Record not found' }, status: :not_found
  end
end
