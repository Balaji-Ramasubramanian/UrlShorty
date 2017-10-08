require "url_shorty/version"
require 'net/http'
require 'uri'
require 'json'
require 'httparty'
require 'Openssl'

module UrlShorty
  # Your code goes here...

  def self.api_key (key)
  	@key = key
    @baseurl = "https://www.googleapis.com/urlshortener/v1/url?key="
    @baseshrt = "&shortUrl="
  end

  def self.short(lurl)
  puts "#{lurl}"
  uri = URI.parse(@baseurl + @key )
  	header = {'Content-Type': 'application/json'}	
  	parameter = {"longUrl": "#{lurl}"}
    
  	http = Net::HTTP.new(uri.host, uri.port)
  	http.use_ssl = true
  	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
   request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = parameter.to_json
   response = http.request(request)
   data = JSON.parse(response.body)
   data["id"]
   puts data["id"]
  end

  def self.expand(surl)
  	url = @baseurl + @key + @baseshrt + surl
    response = ""
    response = HTTParty.get(url)
    parsed = JSON.parse(response.body)
    lurl = parsed['longUrl']
    puts lurl
 end

end
