require 'nasa_apod'

def nasa(day, option)
  client_nasa = NasaApod::Client.new(api_key: ENV['NASA_API_KEY'])
  result = client_nasa.search(date: "#{day}")
  case option
  when "title"
    return result.title
  when "explanation"
    return result.explanation
  when "url"
    return result.url
  end
end

print "Year: "
year = gets.to_i
print "Month: "
month = format("%02d", gets.to_i)
print "Date: "
date = format("%02d", gets.to_i)

day = "#{year}-#{month}-#{date}"
title = nasa(day, "title")
explanation = nasa(day, "explanation")
url = nasa(day, "url")
year = format("%02d", year % 100)
puts title
puts explanation
puts "https://apod.nasa.gov/apod/ap#{year}#{month}#{date}.html"