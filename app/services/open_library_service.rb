class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org/api/books?bibkeys=ISBN:'
  headers 'Content-Type' => 'application/json'

  def api_request(isbn)
    response = self.class.get(isbn + '&jscmd=data&format=json')
    response.body
  end
end
