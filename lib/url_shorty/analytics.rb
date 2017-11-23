module UrlShorty

  class Analytics

       def self.analysis (short_url)
		    url             = BASE_URL + @api_key + SHORT + short_url + PROJECTION
		    response        = ""
		    response        = HTTParty.get(url)
		    parsed          = JSON.parse(response.body)
		    puts parsed
		    return parsed
	  end


	  def self.analytics_alltime(short_url)
		    parsed = analytics(short_url)
		    puts parsed.analytics.alltime
		    return parsed.analytics.alltime
	  end

	  def self.created_at(short_url)
		    parsed = analytics(short_url)
		    return parsed.created
	  end

  end
end