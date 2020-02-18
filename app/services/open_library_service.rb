class OpenLibraryService
  include HTTParty
  base_uri Rails.application.secrets.open_library_url

  def api_request(isbn)
    response = self.class.get(isbn + Rails.application.secrets.open_library_suffix)
    return response if response.blank?

    search = JSON.parse(response.body)['ISBN:' + isbn]
    search
      .slice('title', 'subtitle', 'number_of_pages', 'authors')
      .merge(ISBN: isbn)
  end
end
