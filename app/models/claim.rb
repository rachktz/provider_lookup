require 'rubygems'
require 'httparty'

class Claim
	include HTTParty
	base_uri 'https://data.cms.gov'

	def self.find_by_npi npi
		get('/resource/5fnr-qp4c.json', :query => {:npi => npi})
	end
end
