ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails/capybara"
require 'selenium-webdriver'

class ActionController::TestCase
  include Devise::TestHelpers
end

class ActiveSupport::TestCase
  #ActiveRecord::Migration.check_pending!
  fixtures :all


end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Assertions
end