# UrlShorty
	UrlShorty is ruby gem to simplify URL shortening using Google URL shortener. 
	You can refer the gem Documentation [here](http://www.rubydoc.info/gems/url_shorty/0.0.6)
	Using this you can,
			- Shorten a Long URLs
			- Expand Shortened URLs 
			- Get Analytics of Shortened URL. 

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

##Get Google URL Shortener API Key:
	Refer [Google URL Shortener](https://developers.google.com/url-shortener/v1/getting_started) Getting Started page to create a API key for google url Shortener service. 

##Setting up API key:

	``` UrlShorty.api_key("<Your API KEY>")
	```
##Shorten URL:

	``` UrlShorty.shorten_url("<Long URL>")```

**Example:**
	```UrlShorty.shorten_url("https://github.com/balaji12345/UrlShorty")
		#=>"https://goo.gl/SeRtHU" ```

##Expand URL:
	``` UrlShorty.expand_url("<Shorten URL>")```

	**Example:**
	```UrlShorty.expand_url("https://goo.gl/SeRtHU")
		#=> "https://github.com/balaji12345/UrlShorty" ```

##Get Analytics:
   To get summary of the analytics for the shortened URL
    ```UrlShorty.get_analytics("<shorten URL>")```

#####Basics Info:
		-kind
		-id
		-longUrl
		-status
		-created

**Example:**
``` variable = UrlShorty.get_analytics("https://goo.gl/SeRtHU")
	variable.kind  		#=> "urlshortener#url"
	variable.id 		#=> "https://goo.gl/SeRtHU"
	variable.longUrl 	#=> "https://github.com/balaji12345/UrlShorty"
	variable.created 	#=> "2017-11-26T07:26:32.556+00:00"
```

#####Usage Info:

	   Available Scopes:
	    -allTime
	    -month
	    -week
	    -twoHours

	   Available Data informations:
	    -shortUrlClicks
	    -longUrlClicks
	    -referers
	    -countries
	    -browsers
	    -platforms


**Example**
```
	variable = UrlShorty.get_analytics("https://goo.gl/SeRtHU")
	variable.analytics.allTime.shortUrlClicks 			#=> "88"
	variable.analytics.allTime.referers[0].count 		#=>"73"
	variable.analytics.month.browsers[1].id 			#=>"Chrome"
	variable.analytics.twoHours.platforms[2].id 		#=>"Macintosh"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/url_shorty. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the UrlShorty project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/url_shorty/blob/master/CODE_OF_CONDUCT.md).

