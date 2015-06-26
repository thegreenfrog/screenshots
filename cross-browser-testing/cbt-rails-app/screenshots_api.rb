require 'open-uri'
require 'net/http'
require 'json'


kittens = open('http://placekitten.com/')
response_status = kittens.status
response_body = kittens.read[559, 441]

puts "Response status: #{response_status}"
puts "Response body: \n #{response_body}"

uri = URI('http://crossbrowsertesting.com/api/v3/screenshots')

req = Net::HTTP::Post.new(uri)
req.basic_auth 'aborstein@wespire.com', 'u56426565207b7b9'

### URL 1

req.set_form_data('browser_list_name' => 'Desktop', 'url' => 'https://demo.int.wespire.com/', 'login' => 'demo.int / user@test.com')

res = Net::HTTP.start(uri.hostname, uri.port) {|http|
  http.request(req)
}

results = res.body
puts results

parsed = JSON.parse(results)
resultsUrl = parsed["versions"][0]["show_results_web_url"]

puts "Results URL: #{resultsUrl}"
system "open #{resultsUrl}"

### URL 2

req.set_form_data('browser_list_name' => 'Desktop', 'url' => 'https://demo.int.wespire.com/teams', 'login' => 'demo.int / user@test.com')

res = Net::HTTP.start(uri.hostname, uri.port) {|http|
  http.request(req)
}

results = res.body
puts results

parsed = JSON.parse(results)
resultsUrl = parsed["versions"][0]["show_results_web_url"]

puts "Results URL: #{resultsUrl}"
system "open #{resultsUrl}"
