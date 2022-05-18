require 'nasa_apod'

def nasa(day)
  client_nasa = NasaApod::Client.new(api_key: ENV['NASA_API_KEY'])
  result = client_nasa.search(date: "#{day}")
  return result.title, result.explanation, result.url
end

print "Year: "
year = gets.to_i
print "Month: "
month = format("%02d", gets.to_i)
print "Date: "
date = format("%02d", gets.to_i)

day = "#{year}-#{month}-#{date}"
data = nasa(day)
title = data[0]
explanation = data[1]
url = data[2]

year = format("%02d", year % 100)
puts title
puts explanation
puts url
puts "https://apod.nasa.gov/apod/ap#{year}#{month}#{date}.html"