ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "support/factory_bot"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)
  include Devise::Test::IntegrationHelpers
  include FactoryBot::Syntax::Methods
end
