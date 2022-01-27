source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
  # Rspec for testing
  gem 'rspec-rails', '~> 3.9.0'
  # Database cleaner
  gem 'database_cleaner', '~> 1.7.0'
  # Faker to create fake data
  gem 'faker', '~> 2.7.0'
  # FactoryBot to create factories from the models
  gem 'factory_bot_rails', '~> 5.1.1'
  gem 'shoulda-matchers', '~> 3.0'
  # Dotenv for env vars
  gem 'dotenv', '~> 2.7.5'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Rspec for testing
  gem 'rspec-rails', '~> 3.9.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Rubocop & Rubocop-Rails
gem 'rubocop', '~> 0.76.0'
gem 'rubocop-rails', '~> 2.3.2'

# Devise gem for user authentication
gem 'devise_token_auth', '~> 1.1.3'

# Active Model Serializers to serialize JSON responses
gem 'active_model_serializers', '~> 0.10.0'

# Wor-Paginate for paginated responses
gem 'wor-paginate', '~> 0.1.8'

# Sidekiq - Mailer queues
gem 'sidekiq', '~> 6.4.0'

# I18n - Strings internationalization
gem 'rails-i18n', '~> 5.1.3'

# Pundit - Endpoints authorization
gem 'pundit', '~> 2.1.0'

# API integration - Httparty
gem 'httparty', '~> 0.17.3'

# Webmock - Mocks and stubs in tests
gem 'webmock', '~> 3.7.6'

# JSON_Spec - JSON comparison
gem 'json_spec', '~> 1.1.5'

# Sidekiq-scheduler - Mailer and other jobs scheduling
gem 'sidekiq-scheduler', '~> 3.0.1'
