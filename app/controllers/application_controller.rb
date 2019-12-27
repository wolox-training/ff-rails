class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  protect_from_forgery with: :null_session

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render json: { message: 'User not authorized to perform this action' }, status: :unauthorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  def not_found_error
    render json: { message: 'Record not found' }, status: :not_found
  end
end
