require 'screenshot'

settings = {:username => "clu@wespire.com", :password => "Chrislu2*"}
client = Screenshot::Client.new(settings)

client.get_os_and_browsers

params = {
    :url => "www.wikipedia.org",
    :win_res => "1024x768",     #Options : "1024x768", "1280x1024"
    :mac_res => "1920x1080",    #Options : "1024x768", "1280x960", "1280x1024", "1600x1200", "1920x1080"
    :quality => "compressed",   #Options : "compressed", "original"
    :wait_time => 5,            #Options: 2, 5, 10, 15, 20, 60
    :orientation => "portrait", #Options: "portrait", "landscape"
    :tunnel => true,
    :browsers => [
            {:os=>"Windows",:os_version=>"7",:browser=>"chrome",:browser_version=>"40.0"},
            {:os=>"OS X",:os_version=>"Mavericks",:browser=>"safari",:browser_version=>"5.0"}
    ]
}

request_id = client.generate_screenshots params

client.screenshots request_id
