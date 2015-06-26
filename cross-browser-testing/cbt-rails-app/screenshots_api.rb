require 'open-uri'
require 'net/http'
require 'json'

uri = URI('http://crossbrowsertesting.com/api/v3/screenshots')
req = Net::HTTP::Post.new(uri)
req.basic_auth 'aborstein@wespire.com', 'u56426565207b7b9'


# ### Test Home page on int.demo on OSX Chrome at 1152x864 resolution
# req.set_form_data(
#   'browser_list_name' => 'OSX-Chrome',
#   'url' => 'https://demo.int.wespire.com/',
#   'login' => 'demo.int / user@test.com'
# )
# res = Net::HTTP.start(uri.hostname, uri.port) {|http|
#   http.request(req)
# }
# results = res.body
# puts results
# parsed = JSON.parse(results)
# resultsUrl = parsed["versions"][0]["show_results_web_url"]
# puts "Results URL: #{resultsUrl}"
# system "open #{resultsUrl}"


### Home page on int.demo on 9 Desktop browsers at 1152x864 resolution
req.set_form_data(
  'browser_list_name' => 'Desktop',
  'url' => 'https://demo.int.wespire.com/',
  'login' => 'demo.int / user@test.com'
)
res = Net::HTTP.start(uri.hostname, uri.port) {|http|
  http.request(req)
}
results = res.body
puts results
parsed = JSON.parse(results)
resultsUrl = parsed["versions"][0]["show_results_web_url"]
puts "Results URL: #{resultsUrl}"
system "open #{resultsUrl}"


### Teams page on int.demo on 9 Desktop browsers at 1152x864 resolution
req.set_form_data(
  'browser_list_name' => 'Desktop',
  'url' => 'https://demo.int.wespire.com/teams',
  'login' => 'demo.int / user@test.com'
)
res = Net::HTTP.start(uri.hostname, uri.port) {|http|
  http.request(req)
}
results = res.body
puts results
parsed = JSON.parse(results)
resultsUrl = parsed["versions"][0]["show_results_web_url"]
puts "Results URL: #{resultsUrl}"
system "open #{resultsUrl}"


### User Settings page on int.demo on 9 Desktop browsers at 1152x864 resolution
req.set_form_data(
  'browser_list_name' => 'Desktop',
  'url' => 'https://demo.int.wespire.com/user/edit',
  'login' => 'demo.int / user@test.com'
)
res = Net::HTTP.start(uri.hostname, uri.port) {|http|
  http.request(req)
}
results = res.body
puts results
parsed = JSON.parse(results)
resultsUrl = parsed["versions"][0]["show_results_web_url"]
puts "Results URL: #{resultsUrl}"
system "open #{resultsUrl}"
