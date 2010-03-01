require 'selenium/selenium_test_case'

class HappyPathTest < SeleniumTestCase

  def test_happy_path
    visit "/"
    assert_contain "Welcome"
  end
end