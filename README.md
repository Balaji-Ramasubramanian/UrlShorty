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

```UrlShorty.shorten_url("<Long URL>")```

**Example:**

```ruby
	UrlShorty.shorten_url("https://github.com/balaji12345/UrlShorty")
		#=>"https://goo.gl/SeRtHU" 
```

## Expand URL:
```ruby
	UrlShorty.expand_url("<Shorten URL>")
 ```

**Example:**
```ruby
	UrlShorty.expand_url("https://goo.gl/SeRtHU")
	#=> "https://github.com/balaji12345/UrlShorty"
 ```

## Get Analytics:
   To get summary of the analytics for the shortened URL,
```ruby
	UrlShorty.get_analytics("<shorten URL>")
```
##### Basics Info:
		-kind
		-id
		-longUrl
		-status
		-created
**Example:**
```ruby
    variable = UrlShorty.get_analytics("https://goo.gl/SeRtHU")
	variable.kind  		#=> "urlshortener#url"
	variable.id 		#=> "https://goo.gl/SeRtHU"
	variable.longUrl 	#=> "https://github.com/balaji12345/UrlShorty"
	variable.created 	#=> "2017-11-26T07:26:32.556+00:00"
```
##### Usage Info:
	   Available Scopes:
	    -allTime
	    -month
	    -week
	    -twoHours

	   Available informations:
	    -shortUrlClicks
	    -longUrlClicks
	    -referers
	    -countries
	    -browsers
	    -platforms


**Example**
```ruby
	variable = UrlShorty.get_analytics("https://goo.gl/SeRtHU")
	variable.analytics.allTime.shortUrlClicks 			
		#=> "88"
	variable.analytics.allTime.referers[0].count 		
		#=>"73"
	variable.analytics.month.browsers[1].id 			
		#=>"Chrome"
	variable.analytics.twoHours.platforms[2].id 		
		#=>"Macintosh"
```


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


