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

req.set_form_data("profile_name" => 'demo.int / user@test.com', 'browsers' => 'Chrome36', 'browsers' => 'MblChrome36', 'url' => 'https://onesmallact.beta.practicallygreen.com/')

res = Net::HTTP.start(uri.hostname, uri.port) {|http|
  http.request(req)
}
req.set_form_data('browser_list_name' => 'Desktop', 'url' => 'http://www.wespire.com')
res = Net::HTTP.start(uri.hostname, uri.port) {|http|
  http.request(req)
}

data = res.body
