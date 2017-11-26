require_relative 'utils'
module UrlShorty
# To get analytics data for Shortened url
# The basic information about the Shortened URL are,
#
#  		- kind
#  		- id
#  		- longUrl
#  		- status
#  		- created
#
# Example:
#
#  		url_analytics_data = UrlShorty.get_analytics("https://goo.gl/XojnVs")
#  		url_analytics_data.kind  	
#  		=> "urlshortener#url"
#  		url_analytics_data.id 		
#  		=> "https://goo.gl/XojnVs"
#  		url_analytics_data.longUrl 	
#  		=> "https://github.com/Balaji-Ramasubramanian/UrlShorty"
#  		url_analytics_data.created 	
#  		=> "2017-11-26T07:26:32.556+00:00"
#
# The Available Scopes are,
#
#  		- allTime
#  		- month
#  		- week
#  		- twoHours
#
# The Available information
#      - shortUrlClicks
#      - longUrlClicks
#      - referers
#      - countries
#      - browsers
#      - platforms
#
# Examples: 
#
#  		url_analytics_data = UrlShorty.get_analytics("https://goo.gl/SeRtHU")
#  		url_analytics_data.analytics.allTime.shortUrlClicks 			
#  		=> "88"
#  		url_analytics_data.analytics.allTime.referers[0].count 		
#  		=>"73"
#  		url_analytics_data.analytics.month.browsers[1].id 			
#  		=>"Chrome"
#  		url_analytics_data.analytics.twoHours.platforms[2].id 		
#  		=>"Macintosh"
#
# @param shorten_url [String] A String represents Shortened URL
# @return parsed_json_obj [Object] A Object that contains the analytics data of the Shortened URL
def self.get_analytics (shorten_url)
    url             = BASE_URL + @api_key + SHORT_URL + shorten_url + PROJECTION
    response        = ""
    response        = HTTParty.get(url)
    parsed_json_obj         = JSON.parse(response.body, object_class: OpenStruct)
    return parsed_json_obj
end
	   
end