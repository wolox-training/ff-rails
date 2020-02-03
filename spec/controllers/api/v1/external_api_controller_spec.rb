require 'rails_helper'

describe Api::V1::ExternalApiController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #book_information' do
    context 'When using a valid ISBN' do
      let!(:valid_isbn) { 'ISBN:0385472579' }
      let!(:book_info_result) do
        JSON.parse(
          File.read('./spec/support/fixtures/external_api_service_response_success.json'),
          symbolize_names: true
        )
      end

      before do
        stubbed_service = instance_double(ExternalApiService)
        allow(stubbed_service).to receive(:api_request).and_return(book_info_result)
        allow(ExternalApiService).to receive(:new).and_return(stubbed_service)
        get :show, params: { isbn: valid_isbn }
      end

      it 'has 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the book JSON' do
        expect(response.body).to eq book_info_result.to_json
      end
    end

    context 'When using an invalid ISBN' do
      let!(:wrong_isbn) { 'wrong_isbn' }
      let!(:not_found_result) do
        JSON.parse(
          File.read('./spec/support/fixtures/external_api_service_not_found.json'),
          symbolize_names: true
        )
      end

      before do
        stubbed_service = instance_double(ExternalApiService)
        allow(stubbed_service).to receive(:api_request).and_return(not_found_result)
        allow(ExternalApiService).to receive(:new).and_return(stubbed_service)
        get :show, params: { isbn: '0385472579' }
      end

      it 'has 404 status' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        expect(response.body).to eq not_found_result.to_json
      end
    end
  end
end
