require "url_shorty/version"
require "url_shorty/utils"
require "url_shorty/analytics"
require 'net/http'
require 'uri'
require 'json'
require 'httparty'
require 'Openssl'
module UrlShorty
 # initialize the client api_key 
  def self.api_key (api_key)
  	@api_key         = api_key
  end


# To shorten the url 
  def self.shorten(long_url)
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

# To expand the shorten url
  def self.expand(short_url)
  	url             = BASE_URL + @api_key + SHORT + short_url
    response        = ""
    response        = HTTParty.get(url)
    parsed          = JSON.parse(response.body)
    long_url            = parsed['longUrl']
    puts long_url
    return long_url 
  end


    
end

