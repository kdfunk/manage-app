# test/test_helper.rb

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "database_cleaner"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors, with: :threads)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add DatabaseCleaner configuration
    DatabaseCleaner.strategy = :transaction

    setup do
      DatabaseCleaner.start
    end

    teardown do
      DatabaseCleaner.clean
    end

    # ... (existing code)
  end
end
