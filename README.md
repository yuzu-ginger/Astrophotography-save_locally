# Saving the Cosmos Images For Ruby(NASA API)
This program is to save the cosmos images from NASA API (APOD).

## Dependency
`ruby 3.1.1`

## Usage
1. Save the cosmos images
Execute app.rb
```
$ ruby app.rb
```
2. Check the title, explanation, and url of the image
Execute explanation.rb
```
$ ruby explanation.rb
Year:  # input the year of the image you want to check
Month: # input the month
Date:  # input the date
# ↓output
"Title"
"Explanation"
"URL"
```
  
## Installation
1. Generate your nasa api(only need your name and email address) --> https://api.nasa.gov/
2. Create Gemfile and `bundle install`
  ```ruby:Gemfile
  source "https://rubygems.org"
  gem 'nasa_apod'
  gem 'open-uri'
  ```
  ```
  $ bundle install
  ```
  <br>Or execute the command<br>
  ```
  $ gem install nasa_apod
  $ gem install open-uri
  ```
3. Chenge `ENV['NASA_API_KEY']` to your API key.
4. Chenge `{PATH}` to the path of the directory you want to save the images.

## Note
If the version of ruby is less than 3, change `URI.open` to `open`.
