class ExternalApiServiceStubs
  include WebMock::API
  def external_api_service_request_success
    stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=ISBN:' + '0385472579'
                       .concat('&format=json&jscmd=data'))
      .to_return(
        status: 200,
        body: File.read('./spec/support/fixtures/external_api_service_response_success.json'),
        headers: { 'Content-Type': 'application/json' }
      )
  end

  def external_api_service_not_found
    stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=ISBN:' + 'wrong_isbn'
                       .concat('&format=json&jscmd=data'))
      .to_return(
        status: 404,
        body: File.read('./spec/support/fixtures/external_api_service_not_found.json'),
        headers: { 'Content-Type': 'application/json' }
      )
  end
end
