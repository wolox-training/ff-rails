class Api::V1::BooksController < ApplicationController
  include Wor::Paginate

  before_action :authenticate_user! 
  
  def index
    render_paginated Book.all
  end

  def show
    render json: Book.find(params[:id])
  end
end
