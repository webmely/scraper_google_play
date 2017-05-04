class ScraperGooglePlay::Search < ScraperGooglePlay::Base

  def initialize(keyword)
  	@agent = Mechanize.new
  	@query = {
  			c: "apps",
  			q: keyword
  		}.to_query
			@page = @agent.get("#{ScraperGooglePlay::SEARCHURL}?#{@query}")
  end

  def apps
  	return nil unless @page
  	list_packname_with_page(@page)
  end


end