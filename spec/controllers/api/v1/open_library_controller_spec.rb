require 'rails_helper'

describe Api::V1::OpenLibraryController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #book_information' do
    let!(:valid_isbn) { '0385472579' }
    let!(:wrong_isbn) { 'wrong_isbn' }
    let!(:stubbed_service) { instance_double(OpenLibraryService) }
    let!(:book_info_result) do
      JSON.parse(
        File.read('./spec/support/fixtures/open_library_service_response_success.json'),
        symbolize_names: true
      ).to_json
    end

    let!(:not_found_result) do
      JSON.parse(
        File.read('./spec/support/fixtures/open_library_service_not_found.json'),
        symbolize_names: true
      ).to_json
    end

    let!(:empty_result) do
      JSON.parse(
        File.read('./spec/support/fixtures/open_library_service_empty_response.json'),
        symbolize_names: true
      )
    end

    before do
      allow(stubbed_service).to receive(:api_request)
        .with(valid_isbn)
        .and_return(book_info_result)
      allow(stubbed_service).to receive(:api_request)
        .with(wrong_isbn)
        .and_return(empty_result)
      allow(OpenLibraryService).to receive(:new).and_return(stubbed_service)
    end

    context 'When using a valid ISBN' do
      before do
        get :show, params: { isbn: valid_isbn }
      end

      it 'has 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the book JSON' do
        expect(response.body).to eq book_info_result
      end
    end

    context 'When using an invalid ISBN' do
      before do
        get :show, params: { isbn: wrong_isbn }
      end

      it 'returns an error message' do
        expect(response.body).to be_json_eql not_found_result
      end

      it 'has 404 status' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
