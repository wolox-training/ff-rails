class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org/api/books?bibkeys=ISBN:'

  def self.api_request(isbn)
    response = get(base_uri + isbn + '&jscmd=data&format=json')
    return if response.blank?
    search = JSON.parse(response.body)['ISBN:' + isbn]

    search
      .slice('title', 'subtitle', 'number_of_pages', 'authors')
      .merge(ISBN: isbn)
  end
end
