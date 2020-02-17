class OpenLibraryService
  include HTTParty
  base_uri ENV['OPEN_LIBRARY_URL']

  def api_request(isbn)
    response = self.class.get(isbn + ENV['OPEN_LIBRARY_SUFFIX'])
    return response if response.blank?

    search = JSON.parse(response.body)['ISBN:' + isbn]
    search
      .slice('title', 'subtitle', 'number_of_pages', 'authors')
      .merge(ISBN: isbn)
  end
end
