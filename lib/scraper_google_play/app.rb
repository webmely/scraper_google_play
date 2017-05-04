class ScraperGooglePlay::App < ScraperGooglePlay::Base
  attr_accessor :package_name, :app_name, :screen_shots, :developer, :address, :email, :title,
  							:genre_text, :genre_id, :version, :description, :android_version, :android_version_text,
 								:size, :vide, :score

  def initialize(package_name, options = {})
  	
  	@package_name = package_name
  	@agent = Mechanize.new
		@query = {
			id: package_name,
		}.merge(options).to_query

		unless exist?("#{ScraperGooglePlay::APPURL}?#{@query}")
			@page = nil
		else 
			@page = @agent.get("#{ScraperGooglePlay::APPURL}?#{@query}")
		end
  end

  def info
  	return {} unless @page
  	detailsInfo = @page.at('.details-info')
		additionalInfo = @page.search('.details-section-contents')

		mainGenre = detailsInfo.at('.category')
		
		android_version_text = @page.at('.details-section-contents div.content[itemprop="operatingSystems"]').text().strip()
		@app_info = {
			name: name,
			logo: logo,
			screen_shots: screen_shots,
			developer: detailsInfo.at('span[itemprop="name"]').text,
			address: @page.at('.content.physical-address').try(:text),
			email: @page.at('.content.contains-text-link .dev-link[href^="mailto:"]') ? @page.at('.content.contains-text-link .dev-link[href^="mailto:"]').attr('href').split(':')[-1] : nil , 
			title: detailsInfo.at('.document-title').text.strip,
			genre_text: mainGenre.text().strip,
			genre_id: mainGenre.attr('href').split('/')[4],
			version: @page.at('.details-section-contents div.content[itemprop="softwareVersion"]').text().strip(),
			description: @page.at('.details-section-contents div[itemprop=description] div').text().gsub(/<\/p>/, '\n</p>'),
			android_version_text: android_version_text,
			android_version: normalizeAndroidVersion(android_version_text),
			contentRating: @page.at('.details-section-contents div.content[itemprop="contentRating"]').text().strip(),
			size: @page.at('.details-section-contents div.content[itemprop="fileSize"]').try(:text),
			video: @page.at('.screenshots span.preview-overlay-container[data-video-url]') ? @page.at('.screenshots span.preview-overlay-container[data-video-url]').attr('data-video-url') : nil,
			score: @page.at('.rating-box div.score').text().to_s.gsub(',', '.'),

		}		
  end

  def similar_app
  	return nil unless @page
  	apps = []
  	recommendation = @page.at(".recommendation")
  	recommendation.search(".cards id-card-list .card.apps").each do |app|
  		apps <<  app.attr('data-docid')
  	end
  	apps
  end

  private
  
  def normalizeAndroidVersion (androidVersionText) 
	  matches = androidVersionText.match(/^([0-9\.]+)[^0-9\.].+/)

	  if (!matches) 
	    return 'VARY'
	  end
	  return matches[1];
	end

  def name
  	elem = @page.search(".id-app-title")
		elem ? elem.first.text : ""
  end

  def logo
		elem = @page.search(".main-content .apps img.cover-image")
		elem ? "http:#{elem.first.attributes["src"].text}" : ""
  end


end