source 'https://rubygems.org'

ruby '2.1.6'

gem 'rails', '4.1.5'
gem 'pg'

gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

gem 'json'
gem 'rabl'
gem 'oj'

gem 'httparty'
gem 'activeadmin', github: 'activeadmin'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'better_errors'
end

group :test do
  gem 'database_cleaner', '~> 1.3.0'
  gem 'webmock'
  gem 'simplecov'
  gem 'shoulda-matchers'
  gem 'capybara'
end

group :production, :staging do
  gem 'rails_12factor'
end
