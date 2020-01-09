require 'rails_helper'

describe Api::V1::BookSuggestionsController, type: :controller do
  include_context 'Authenticated User'

  describe 'POST #create' do
    subject(:post_method) { post :create, params: { book_suggestion: book_suggestion_attributes } }
    context 'When creating a valid book suggestion with user' do
      let!(:book_suggestion_attributes) { attributes_for(:book_suggestion) }

      it 'creates a new book suggestion' do
        expect { post_method }.to change { BookSuggestion.count }.by(1)
      end

      it 'belongs to that user' do
        post_method
        expect(JSON.parse(response.body)['user_id']).to eq user.id
      end

      it { is_expected.to have_http_status(:created) }
    end

    context 'When creating a valid book suggestion without user' do
      let!(:book_suggestion_attributes) { attributes_for(:book_suggestion, user: nil) }
      it 'creates a new book suggestion' do
        expect { post_method }.to change { BookSuggestion.count }.by(1)
      end

      it { is_expected.to have_http_status(:created) }
    end

    context 'When creating an invalid book suggestion' do
      %i[author link title editor year].each do |field|
        let!(:book_suggestion_attributes) { attributes_for(:book_suggestion, field => nil) }
        it 'does not create a book suggestion' do
          expect { post_method }.to change { BookSuggestion.count }.by(0)
        end

        it { is_expected.to have_http_status(:bad_request) }
      end
    end
  end
end
