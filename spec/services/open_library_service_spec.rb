require 'rails_helper'
require 'dotenv/load'

describe OpenLibraryService, type: :service do
  let!(:stubs) { OpenLibraryServiceStubs.new }
  let!(:service) { described_class.new }

  describe 'GET open_library#show' do
    context 'when searching with a valid ISBN' do
      let!(:valid_isbn) { '0385472579' }

      before do
        stubs.request_success
        service.api_request(valid_isbn)
      end

      it 'makes an external request' do
        expect(WebMock)
          .to(have_requested(:get,
                             ENV['OPEN_LIBRARY_URL'] + valid_isbn
                             .concat(ENV['OPEN_LIBRARY_SUFFIX'])))
      end

      it 'returns a hash with expected attributes' do
        expected = File.read('./spec/support/fixtures/open_library_service_response_success.json')
        expect(service.api_request(valid_isbn).to_json).to be_json_eql(expected)
      end
    end

    context 'when searching with an invalid ISBN' do
      let!(:wrong_isbn) { 'wrong_isbn' }

      before do
        stubs.empty_response
        service.api_request(wrong_isbn)
      end

      it 'makes an external request' do
        expect(WebMock)
          .to(have_requested(:get,
                             ENV['OPEN_LIBRARY_URL'] + wrong_isbn
                             .concat(ENV['OPEN_LIBRARY_SUFFIX'])))
      end

      it 'returns an error message' do
        expected = File.read('./spec/support/fixtures/open_library_service_empty_response.json')
        expect(service.api_request(wrong_isbn)).to be_json_eql(expected)
      end
    end
  end
end
