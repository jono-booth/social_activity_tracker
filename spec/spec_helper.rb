require 'simplecov'

RSpec.configure do |config|
  config.order = :random

  SimpleCov::Formatter::HTMLFormatter
  SimpleCov.start do
    add_filter 'app/admin'
    add_filter 'lib'
  end
end
