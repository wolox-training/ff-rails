require 'rails_helper'

describe ExternalApiService, type: :service do
  let!(:stubs)  { ExternalApiServiceStubs.new }

  describe 'GET external_api#show' do
    context 'when searching with a valid ISBN' do
      let!(:isbn) { '0385472579' }

      before do
        stubs.external_api_service_request_success(isbn)
        ExternalApiService.api_request(isbn)
      end

      it 'makes an external request' do
        expect(WebMock)
          .to(have_requested(:get,
                            'https://openlibrary.org/api/books?bibkeys=ISBN:' + isbn + '&format=json&jscmd=data'))
      end
    end
  end
end
