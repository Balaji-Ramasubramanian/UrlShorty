# UrlShorty

UrlShorty is ruby gem to simplify URL shortening using Google URL shortener. 
You can refer the gem Documentation [here](http://www.rubydoc.info/gems/url_shorty/0.0.6)

  Using this you can,
- Shorten a Long URL
- Expand Shortened URL
- Get Analytics details of a Shortened URL. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'url_shorty'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install url_shorty

## Usage
## Get Google URL Shortener API Key:
Refer [Google URL Shortener](https://developers.google.com/url-shortener/v1/getting_started) Getting Started page to create a API key for google url Shortener service. 

## Setting up API key:

```ruby
	UrlShorty.api_key("<Your API KEY>")
```
## Shorten URL:
```ruby
	UrlShorty.shorten_url("<Long URL>")
```

**Example:**

```ruby
	UrlShorty.shorten_url("https://github.com/Balaji-Ramasubramanian/UrlShorty")
	#=>"https://goo.gl/XojnVs" 
```

## Expand URL:
```ruby
	UrlShorty.expand_url("<Shorten URL>")
 ```

**Example:**
```ruby
	UrlShorty.expand_url("https://goo.gl/XojnVs")
	#=> "https://github.com/Balaji-Ramasubramanian/UrlShorty"
 ```

## Get Analytics:
   To get summary of the analytics for the shortened URL,
```ruby
	UrlShorty.get_analytics("<shorten URL>")
```
##### Basics Info:

- kind
- id
- longUrl
- status
- created

**Example:**
```ruby
    url_analytics = UrlShorty.get_analytics("https://goo.gl/XojnVs")
	url_analytics.kind  	#=> "urlshortener#url"
	url_analytics.id 		#=> "https://goo.gl/XojnVs"
	url_analytics.longUrl 	#=> "https://github.com/Balaji-Ramasubramanian/UrlShorty"
	url_analytics.created 	#=> "2017-11-26T07:26:32.556+00:00"
```
##### Usage Info:
Available Scopes:
- allTime
- month
- week
- twoHours

Available information:
- shortUrlClicks
- longUrlClicks
- referers
- countries
- browsers
- platforms


**Example**
```ruby
	url_analytics = UrlShorty.get_analytics("https://goo.gl/SeRtHU")
	url_analytics.analytics.allTime.shortUrlClicks 			
	#=> "88"
	url_analytics.analytics.allTime.referers[0].count 		
	#=>"73"
	url_analytics.analytics.month.browsers[1].id 			
	#=>"Chrome"
	url_analytics.analytics.twoHours.platforms[2].id 		
	#=>"Macintosh"
```


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


