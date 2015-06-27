class PagesController < ApplicationController
  def home
  end

  def about
  end

  def claims
  	
  	response = HTTParty.get('https://data.cms.gov/resource/5fnr-qp4c.json?npi=1104813138')

  end
  
end
