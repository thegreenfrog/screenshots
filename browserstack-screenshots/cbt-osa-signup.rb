#Please visit here https://code.google.com/p/selenium/wiki/RubyBindings for detailed installation and instructions
require 'rubygems'
require "selenium-webdriver"

caps = Selenium::WebDriver::Remote::Capabilities.new

caps["name"] = "Selenium Test Example"
caps["build"] = "1.0"
caps["browser_api_name"] = "IE9"
caps["os_api_name"] = "Win7-C2"
caps["screen_resolution"] = "1280x768"
#caps["record_video"] = "true"
#caps["record_network"] = "true"
#caps["record_snapshot"] = "true"

puts 'Starting onesmallact new user signup process...'

driver = Selenium::WebDriver.for(:remote,
:url => "http://aborstein%40wespire.com:u56426565207b7b9@hub.crossbrowsertesting.com:80/wd/hub",
:desired_capabilities => caps)

puts 'Navigating to https://onesmallact.beta.practicallygreen.com/users/new...'
driver.get "https://onesmallact.beta.practicallygreen.com/users/new"

rand_int = rand(1000..9999)
rand_user = "Screenshot User_#{rand_int}"
rand_username = "screenshot_user_#{rand_int}@test.com"
puts "Registering new user '#{rand_user}' (email: #{rand_username} / pw: test1234)"

driver.find_element(:id, "user_name").click
driver.find_element(:id, "user_name").clear
driver.find_element(:id, "user_name").send_keys rand_user
driver.find_element(:id, "user_nickname").click
driver.find_element(:id, "user_email").click
driver.find_element(:id, "user_email").clear
driver.find_element(:id, "user_email").send_keys rand_username
driver.find_element(:id, "user_password").click
driver.find_element(:id, "user_password").clear
driver.find_element(:id, "user_password").send_keys "test1234"

puts "Saving screenshot of #{driver.title}..."
image_title_form = "screenshots/ie9_osa-newuser#{rand_int}-form.png"
driver.manage.window.maximize
driver.save_screenshot(image_title_form)

driver.find_element(:name, "commit").click

puts 'Choosing 3 interests...'
if not driver.find_element(:id, "user_interest_welcome_project_id_7").selected?
    driver.find_element(:id, "user_interest_welcome_project_id_7").click
end

if not driver.find_element(:id, "user_interest_welcome_project_id_6").selected?
    driver.find_element(:id, "user_interest_welcome_project_id_6").click
end

if not driver.find_element(:id, "user_interest_welcome_project_id_5").selected?
    driver.find_element(:id, "user_interest_welcome_project_id_5").click
end

puts "Saving screenshot of #{driver.title}..."
image_title_interests = "screenshots/ie9_osa-newuser#{rand_int}-interests.png"
driver.manage.window.maximize
driver.save_screenshot(image_title_interests)

driver.find_element(:name, "commit").click

puts "Saving screenshot of #{driver.title}..."
image_title_dashboard = "screenshots/ie9_osa-newuser#{rand_int}-dashboard.png"
driver.manage.window.maximize
driver.save_screenshot(image_title_dashboard)

puts 'Quitting...'
driver.quit

puts 'All done!'

system "open screenshots"
