require 'spec_helper'

describe ScraperGooglePlay::App do

  it 'has a version number' do
    expect(ScraperGooglePlay::VERSION).not_to be nil
  end

  it 'if package invalid' do 
    app = ScraperGooglePlay::App.new('com.webmely.serverlist1234')
    expect(app.instance_variable_get('@page')).to eq(nil)
  end 
  
  it 'connects to app and get info' do
    app = ScraperGooglePlay::App.new('com.ekesoo.font')
    app_invalid = ScraperGooglePlay::App.new('com.webmely.serverlist1234')
    expect(app.info).to_not eq(nil)
    expect(app_invalid.info).to eq({})
  end

  it 'similar app ' do
    app = ScraperGooglePlay::App.new('com.ekesoo.font')
    app_invalid = ScraperGooglePlay::App.new('com.webmely.serverlist1234')
    expect(app.similar_app).to_not eq(nil)
    expect(app_invalid.similar_app).to eq(nil)
  end

end
