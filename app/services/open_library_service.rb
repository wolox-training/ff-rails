class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org/api/books?bibkeys=ISBN:'
  headers 'Content-Type' => 'application/json'

  def api_request(isbn)
    response = self.class.get(isbn + '&jscmd=data&format=json')
    return response if response.blank?

    search = JSON.parse(response.body)['ISBN:' + isbn]
    search
      .slice('title', 'subtitle', 'number_of_pages', 'authors')
      .merge(ISBN: isbn)
  end
end
