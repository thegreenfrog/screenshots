require 'rubygems'
require 'selenium-webdriver'

# Specify the driver path
chromedriver_path = "vendor/chromedriver"
Selenium::WebDriver::Chrome.driver_path = chromedriver_path

driver = Selenium::WebDriver.for :chrome                      # use selenium in Chrome
driver.get "http://google.com"                                # fetch a web page (google)

element = driver.find_element :name => "q"
element.send_keys "Test!"
element.submit

puts "Page title is #{driver.title}"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.downcase.start_with? "test!" }

puts "Page title is #{driver.title}"
driver.quit
