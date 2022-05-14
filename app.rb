require 'nasa_apod'
require 'open-uri'
require 'date'

def nasa(today, option)
  client_nasa = NasaApod::Client.new(api_key: ENV['NASA_API_KEY']) #DEMO_KEY usage is limited.
  result = client_nasa.search(date: "#{today}") #You can also pass in a Ruby Date object.
  case option
  when "url"
    return result.url
  when "title"
    return result.title
  end
end

today = Date.today - 1   # NASA(US)との時差のため昨日の日付にする
url = nasa(today, "url")
title = nasa(today, "title")
if url =~ /jpg/
  file = "{PASS}#{today}.jpg"
  URI.open(file, 'wb') do |output|
    URI.open(url) do |data|
      output.puts(data.read)
      puts "#{today} ok"
    end
  end
else
  puts "not jpg"
  puts url
end
  
puts "#{title}"