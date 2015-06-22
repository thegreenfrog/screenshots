#Please visit here https://code.google.com/p/selenium/wiki/RubyBindings for detailed installation and instructions
require 'rubygems'
require "selenium-webdriver"

caps = Selenium::WebDriver::Remote::Capabilities.new

caps["name"] = "Selenium Test Example"
caps["build"] = "1.0"
caps["browser"] = "Firefox"
caps["browser_version"] = "36.0"
caps["os"] = 'OS X'
caps["os_version"] = 'Mavericks'
caps["screen_resolution"] = "1280x768"

caps['browserstack.local'] = 'true'
caps['build'] = 'firstTest'
caps['project'] = 'screenshots'
#caps["record_video"] = "true"
#caps["record_network"] = "true"
#caps["record_snapshot"] = "true"

puts 'Starting cbt-test...'

driver = Selenium::WebDriver.for(:remote,
:url => "http://andrewborstein1:fK7U9BqEyc8vAoYpgpME@hub.browserstack.com/wd/hub",
:desired_capabilities => caps)

#maximize the window - DESKTOPS ONLY
puts 'Navigating to test site...'
driver.navigate.to "http://crossbrowsertesting.github.io/selenium_example_page.html"
driver.manage.window.maximize

puts 'Fetching screenshot...'
driver.save_screenshot('screenshots/ie9_example-page.png')

puts 'Fetching page <title>...'
puts "<title> #{driver.title}"

#maximize the window - DESKTOPS ONLY
puts 'Navigating to one small act...'
driver.navigate.to "https://onesmallact.beta.practicallygreen.com/sign_in"

puts 'Entering email...'
email = driver.find_element :name => "session[email]"
email.send_keys "test@example.com"

puts 'Entering password...'
password = driver.find_element :name => "session[password]"
password.send_keys "test1234"

puts 'Submitting form...'
password.submit

# puts 'Waiting 10 seconds'
# wait = Selenium::WebDriver::Wait.new(:timeout => 10)
# wait.until { driver.title.downcase.start_with? "One Small Act | Dashboard" }

puts 'Fetching screenshot...'
driver.manage.window.maximize
driver.save_screenshot('screenshots/firefox_osx-dashboard.png')

puts 'Fetching page <title>...'
puts "<title> #{driver.title}"

puts 'Quitting...'
driver.quit

puts 'All done!'
