require_relative 'utils'
module UrlShorty

       def self.get_analytics (short_url)
		    url             = BASE_URL + @api_key + SHORT_URL + short_url + PROJECTION
		    response        = ""
		    response        = HTTParty.get(url)
		    parsed         = JSON.parse(response.body, object_class: OpenStruct)
		    return parsed
	   end
	   
end