require "url_shorty/version"
require "url_shorty/utils"
require "url_shorty/analytics"
require 'uri'
require 'json'
require 'httparty'
require 'Openssl'

# @author Balaji
module UrlShorty
  # @param api_key [String] Google URL Shortener API KEY 
  # @return [nil]
  # This method will set-up the Google URL shortener API key for your project. 
  # If you don't have any API key, { Click here }[https://developers.google.com/url-shortener/v1/getting_started] to create one for your project.
  # Example:
  #
  #     UrlShorty.api_key("<API KEY>")
  #
  def self.api_key (api_key)
    @api_key         = api_key
  end

  # @param long_url [String] A url value that has to be shortened
  # @return [String] A string representing the shortened URL
  # This method will shorten the provided long URL into a short URL using the Google URL shortener service. 
  # Example:
  #
  #     UrlShorty.shorten_url(""https://github.com/Balaji-Ramasubramanian/UrlShorty")
  #      => "https://goo.gl/XojnVs"
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
    if data["id"] != nil then
      return data["id"]
    else
      puts data
      return data["error"]["errors"][0]["reason"]
    end
  end

  # @param shorten_url [String] A url value that has to be expanded
  # @return [String] A string representing the expanded URL
  # This method will expand the shortened URL into a long URL
  # Example:
  #
  #     UrlShorty.expand_url("https://goo.gl/XojnVs")
  #      => "https://github.com/Balaji-Ramasubramanian/UrlShorty"
  #
  def self.expand_url(shorten_url)
    url             = BASE_URL + @api_key + SHORT_URL + shorten_url
    response        = ""
    response        = HTTParty.get(url)
    parsed          = JSON.parse(response.body)
    long_url        = parsed['longUrl']
    puts long_url
    return long_url 
  end
    
end

