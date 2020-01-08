class ExternalApiServiceStubs
  include WebMock::API
  def external_api_service_request_success(isbn)
    stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=ISBN:' + isbn + '&format=json&jscmd=data')
      .to_return(
        status: 200,
        body: File.read('./spec/support/fixtures/external_api_service_response_success.json'),
        headers: { 'Content-Type': 'application/json' }
      )
  end
end
