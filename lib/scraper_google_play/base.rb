class ScraperGooglePlay::Base
  def exist?(url)
  	uri = URI("#{url}")
		status_code = Net::HTTP.get_response(uri).code
		case status_code
		when '200'
			return true
		when '404'
			return false
		else
			return false
		end
  end

   def list_packname_with_page(page)
  	return nil if page.nil?
  	apps = []
  	page.search('.id-card-list.card-list .card.apps').each do |elm|
  		apps << elm.attr('data-docid')
  	end
  	apps  	
  end
end