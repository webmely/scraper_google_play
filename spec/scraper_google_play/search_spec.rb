require 'spec_helper'

describe ScraperGooglePlay::Search do

  it 'if package invalid' do 
    app = ScraperGooglePlay::Search.new('test')
    expect(app.instance_variable_get('@page')).to_not eq(nil)
  end

  it 'connects and search app' do
    app = ScraperGooglePlay::Search.new('PERSONALIZATION').apps
    expect(app).to_not eq(nil)
  end
  
end