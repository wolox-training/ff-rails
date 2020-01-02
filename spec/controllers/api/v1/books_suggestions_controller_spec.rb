require 'rails_helper'

describe Api::V1::BookSuggestionsController, type: :controller do
  include_context 'Authenticated User'

  describe 'POST #create' do
    context 'When creating a valid book suggestion with user' do
      let!(:book_suggestion_attributes) { attributes_for(:book_suggestion, user: user) }

      it 'creates a new book suggestion' do
        expect do
          post :create, params: { id: user.id, book_suggestion: book_suggestion_attributes }
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'has status code 201' do
        post :create, params: { id: user.id, book_suggestion: book_suggestion_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating valid book suggestion without user' do
      let!(:book_suggestion_attributes) { attributes_for(:book_suggestion, user: nil) }
      it 'creates a new book suggestion' do
        expect do
          post :create, params: { id: user.id, book_suggestion: book_suggestion_attributes }
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'has status code 201' do
        post :create, params: { id: user.id, book_suggestion: book_suggestion_attributes }
        expect(response).to have_http_status(:created)
      end
    end
  end
end
