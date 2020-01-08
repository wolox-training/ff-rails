class ExternalApiService
	include HTTParty
	base_uri 'https://openlibrary.org/api/books?bibkeys=ISBN:'

	def self.api_request(isbn)
		self.get(base_uri + isbn + '&jscmd=data&format=json')
	end

end
