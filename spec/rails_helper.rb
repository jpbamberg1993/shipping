ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'

config.use_transactional_fixtures = false

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCLeaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCLeaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCLeaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCLeaner.start
  end

  config.after(:each) do
    DatabaseCLeaner.clean
  end
end
