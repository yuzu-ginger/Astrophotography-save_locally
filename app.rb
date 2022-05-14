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
  file = "/Users/20241184/OneDrive - 京都女子大学/画像/nasa_images/#{today}.jpg"
  p file
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