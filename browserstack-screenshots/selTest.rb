#please visit here https://code.google.com/p/selenium/wiki/RubyBindings for detailed installation and instructions

require "selenium-webdriver"

caps = Selenium::WebDriver::Remote::Capabilities.new

caps["name"] = "Selenium Test Example"
caps["build"] = "1.0"
caps["browser_api_name"] = "Chrome39x64"
caps["os_api_name"] = "Mac10.9"
caps["screen_resolution"] = "1024x768"
caps["record_video"] = "true"
caps["record_network"] = "true"
caps["record_snapshot"] = "false" 

driver = Selenium::WebDriver.for(:remote, 
:url => "http://aborstein%40wespire.com:u56426565207b7b9@hub.crossbrowsertesting.com:80/wd/hub",
:desired_capabilities => caps)

#maximize the window - DESKTOPS ONLY
driver.navigate.to "http://www.wikipedia.org"
driver.manage.window.maximize

puts driver.title

driver.quit

