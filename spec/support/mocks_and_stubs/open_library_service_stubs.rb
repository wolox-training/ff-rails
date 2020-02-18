class OpenLibraryServiceStubs
  include WebMock::API
  def request_success
    fake_request('0385472579')
      .to_return(
        status: 200,
        body: File.read('./spec/support/fixtures/open_library_service_entire_response.json'),
        headers: { 'Content-Type': 'application/json' }
      )
  end

  def empty_response
    fake_request('wrong_isbn')
      .to_return(
        status: 200,
        body: File.read('./spec/support/fixtures/open_library_service_empty_response.json'),
        headers: { 'Content-Type': 'application/json' }
      )
  end

  def fake_request(isbn)
    stub_request(:get, Rails.application.secrets.open_library_url + isbn
                       .concat(Rails.application.secrets.open_library_suffix))
  end
end
