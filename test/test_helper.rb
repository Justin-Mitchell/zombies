ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "mocha/test_unit"
require "capybara/rails"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_presence(model, field)
     model.valid?
     assert_match /can't be blank/, model.errors[field].join, "Presence error for #{field} not found on #{model.class}" 
  end
  
  def create_tweet_for(zombie, status)
     visit new_tweet_url
     fill_in 'Status', with: status
     select zombie, from: 'tweet_zombie_id'
     click_button 'Create Tweet' 
  end
end

class ActionDispatch::IntegrationTest
   include Capybara::DSL
   
   def teardown
      Capybara.reset_sessions!
      Capybara.use_default_driver 
   end 
end
