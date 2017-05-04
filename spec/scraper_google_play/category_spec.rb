require 'spec_helper'

describe ScraperGooglePlay::Category do

  it 'if package invalid' do 
    app = ScraperGooglePlay::Category.new('com.webmely.serverlist1234')
    expect(app.instance_variable_get('@page')).to eq(nil)
  end 
  
  it 'connects and get all app' do
    category = ScraperGooglePlay::Category.new('PERSONALIZATION')
    expect(category.all_app).to_not eq(nil)
  end

  it 'connects and get top selling pay' do
    topselling_paid = ScraperGooglePlay::Category.new('PERSONALIZATION').topselling_paid
    expect(topselling_paid).to_not eq(nil)
  end

  it 'connects and get top selling free' do
    category = ScraperGooglePlay::Category.new('PERSONALIZATION')
    expect(category.topselling_free).to_not eq(nil)
  end

  it 'connects and get top topgrossing' do
    category = ScraperGooglePlay::Category.new('PERSONALIZATION')
    expect(category.topgrossing).to_not eq(nil)
  end
  
  it 'connects and get topselling_new_paid' do
    category = ScraperGooglePlay::Category.new('PERSONALIZATION')
    expect(category.topselling_new_paid).to_not eq(nil)
  end
  
  it 'connects and get topselling_new_free ' do
    category = ScraperGooglePlay::Category.new('PERSONALIZATION')
    expect(category.topselling_new_free).to_not eq(nil)
  end


end