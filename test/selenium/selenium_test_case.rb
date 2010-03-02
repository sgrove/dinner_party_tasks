require 'test_helper'
require 'socket'
require "webrat"

class SeleniumTestCase < ActionController::IntegrationTest

  self.use_transactional_fixtures = false
  self.fixture_path = RAILS_ROOT + '/spec/fixtures/'


  Webrat.configure do |config|
    puts "configuring webrat"
    puts "config.mode = #{:selenium}"
    config.mode = :selenium

    config.application_framework = :external if ENV["sauce"]

    ["selenium_browser_key", "selenium_server_address", "application_address", "application_port"].each do |key|

      if ENV[key]
        config.send((key + '=').to_sym, ENV[key]) if ENV[key]
      end
      puts "config.#{key} = #{config.send((key).to_sym)}"
    end
  end

end