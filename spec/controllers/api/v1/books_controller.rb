require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'
  include Wor::Paginate

  describe 'GET #index' do
    context 'When fetching all the books' do
      let!(:books) { create_list(:book, 5) }

      before do
        get :index
      end

      it 'returns all the books' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'is paginated' do
        expect(JSON.parse(response.body)).to be_paginated
      end

      it 'has 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book' do
      let!(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'returns the book json' do
        expect(JSON.parse(response.body).to_json).to eq BookSerializer.new(
          book, root: false
        ).to_json
      end

      it 'has 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
