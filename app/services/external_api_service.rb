class ExternalApiService
  include HTTParty
  base_uri 'https://openlibrary.org/api/books?bibkeys=ISBN:'

  def api_request(isbn)
    self.class.get(isbn + '&jscmd=data&format=json')
  end
end
