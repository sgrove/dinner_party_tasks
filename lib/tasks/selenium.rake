namespace :test do
  Rake::TestTask.new(:selenium => "db:test:prepare") do |t|
    t.libs << "test"
    t.pattern = 'test/selenium/**/*_test.rb'
    t.verbose = true
  end
  Rake::Task['test:selenium'].comment =
          "Run the selenium tests in test/selenium"


  Rake::TestTask.new(:sauce => "db:test:prepare") do |t|

    ENV["application_address"] = "smooth-water-95.heroku.com"
    ENV["application_framework"] = "external"
    ENV["application_port"] = "80"
    ENV["selenium_server_address"] = "saucelabs.com"
    ENV["selenium_browser_key"] = '{"username": "princesspanda", "access-key": "301618e9-e2b4-427a-a121-ac19b501ec66",
"os": "Windows 2003", "browser": "firefox", "browser-version": "3.", "max-duration" : "240"}'

    t.libs << "test"
    t.pattern = 'test/selenium/**/*_test.rb'
    t.verbose = true
  end

  Rake::Task['test:sauce'].comment =
          "Run the selenium tests using Sauce OnDemand"
 
end