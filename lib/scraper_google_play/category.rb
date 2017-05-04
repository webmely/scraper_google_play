class ScraperGooglePlay::Category < ScraperGooglePlay::Base

  def initialize(category_name)
  	@category_name = category_name.upcase
  	@agent = Mechanize.new

		unless exist?("#{ScraperGooglePlay::CATEGORYURL}#{@category_name}")
			@page = nil
		else 
			@page = @agent.get("#{ScraperGooglePlay::CATEGORYURL}#{@category_name}")
		end
  end

  def all_app
  	return nil unless @page
  	list_packname_with_page(@page)
  end

  def topselling_paid
  	return nil unless @page
  	sub_page = @agent.get("#{ScraperGooglePlay::CATEGORYURL}#{@category_name}/collection/topselling_paid")
  	list_packname_with_page(sub_page)
  end

  def topselling_free
  	return nil unless @page
  	sub_page = @agent.get("#{ScraperGooglePlay::CATEGORYURL}#{@category_name}/collection/topselling_free")
  	list_packname_with_page(sub_page)
  end

  def topgrossing
  	return nil unless @page
  	sub_page = @agent.get("#{ScraperGooglePlay::CATEGORYURL}#{@category_name}/collection/topgrossing")
  	list_packname_with_page(sub_page)
  end

  def topselling_new_paid
  	return nil unless @page
  	sub_page = @agent.get("#{ScraperGooglePlay::CATEGORYURL}#{@category_name}/collection/topselling_new_paid")
  	list_packname_with_page(sub_page)
  end

  def topselling_new_free
  	return nil unless @page
  	sub_page = @agent.get("#{ScraperGooglePlay::CATEGORYURL}#{@category_name}/collection/topselling_new_free")
  	list_packname_with_page(sub_page)
  end
  
  private


end