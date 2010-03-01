require 'test_helper'
require 'socket'
require "webrat"

class SeleniumTestCase < ActionController::IntegrationTest

  self.use_transactional_fixtures = false
  self.fixture_path = RAILS_ROOT + '/spec/fixtures/'


  Webrat.configure do |config|
    # config.mode = :rails
    config.mode = :selenium
    config.application_framework = :external
    config.selenium_server_address = "saucelabs.com"
    config.selenium_browser_key = '{"username": "princesspanda", "access-key": "301618e9-e2b4-427a-a121-ac19b501ec66",
"os": "Windows 2003", "browser": "firefox", "browser-version": "3."}'
    config.application_address = "http://localhost:3000"
    config.application_port = "80"
  end

#  Webrat.configure do |config|
#    puts "configuring webrat"
#    puts "config.mode = #{:selenium}"
#    config.mode = :selenium
#    ["selenium_browser_key", "selenium_server_address", "application_address", "application_port"].each do |key|
#      puts "config.#{key} = #{config.send((key).to_sym)}"
#    end
#  end

end

