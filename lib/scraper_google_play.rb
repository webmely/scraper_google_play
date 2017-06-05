
module ScraperGooglePlay
  APPURL = "https://play.google.com/store/apps/details"
  CATEGORYURL = "https://play.google.com/store/apps/category/"
  SEARCHURL = "https://play.google.com/store/search"
end

require 'mechanize' # and any other gems you need
require 'active_support/all'
require 'scraper_google_play/base'
require 'scraper_google_play/app'
require 'scraper_google_play/category'
require 'scraper_google_play/search'