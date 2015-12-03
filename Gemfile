source 'https://rubygems.org'

ruby '2.1.6'

gem 'rails', '4.2.3'
gem 'pg'
gem 'newrelic_rpm'

gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

gem 'json'
gem 'rabl'
gem 'oj'

gem 'therubyracer', platforms: :ruby
gem 'turbolinks'

gem 'httparty'
gem 'activeadmin', github: 'activeadmin'
gem 'devise'

gem 'delayed_job_active_record'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'dotenv-rails'
end

group :development do
  gem 'better_errors'
  gem 'thin'
  gem 'spring'
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
  gem 'uglifier'
end
