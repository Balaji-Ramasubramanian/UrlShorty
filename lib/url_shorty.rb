require "url_shorty/version"
require "url_shorty/utils"
require "url_shorty/analytics"
require 'net/http'
require 'uri'
require 'json'
require 'httparty'
require 'Openssl'

# @author Balaji
module UrlShorty

 # This method will set-up the Google URL shortener API key for your project. 
 # If you don't have any API key, { Click here }[https://developers.google.com/url-shortener/v1/getting_started] to create one for your project.
 # @param api_key [String] Google URL Shortener API KEY 
 # @return [nil]
 #
 # UrlShorty.api_key("<API KEY>")
 #
  def self.api_key (api_key)
  	@api_key         = api_key
  end


# This method will shorten the provided long URL into a short URL using the Google URL shortener service. 
# @param long_url [String] A url value that has to be shortened
# @return [String] A string representing the shortened URL
#
# UrlShorty.shorten_url(""https://github.com/Balaji-Ramasubramanian/UrlShorty")
# => "https://goo.gl/XojnVs"
#
  def self.shorten_url(long_url)
   uri              = URI.parse( BASE_URL + @api_key )
   header           = {'Content-Type': 'application/json'}	
   parameter        = {"longUrl": "#{long_url}"}  
   http             = Net::HTTP.new(uri.host, uri.port)
   http.use_ssl     = true
   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
   request          = Net::HTTP::Post.new(uri.request_uri, header)
   request.body     = parameter.to_json
   response         = http.request(request)
   data             = JSON.parse(response.body) 
   return data["id"]
  end

# This method will expand the shortened URL into a long URL
# @param shorten_url [String] A url value that has to be expanded
# @return [String] A string representing the expanded URL
#
# UrlShorty.expand_url("https://goo.gl/XojnVs")
# => "https://github.com/Balaji-Ramasubramanian/UrlShorty"
  def self.expand_url(shorten_url)
  	url             = BASE_URL + @api_key + SHORT + shorten_url
    response        = ""
    response        = HTTParty.get(url)
    parsed          = JSON.parse(response.body)
    long_url            = parsed['longUrl']
    puts long_url
    return long_url 
  end


    
end

