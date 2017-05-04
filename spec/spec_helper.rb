$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'bundler/setup'
Bundler.setup

require 'mechanize' # and any other gems you need
require 'active_support/all'
require 'scraper_google_play/base'
require 'scraper_google_play/app'
require 'scraper_google_play/category'
require 'scraper_google_play/search'
RSpec.configure do |config|
  # some (optional) config here
end