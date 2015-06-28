require 'rubygems'
require 'httparty'

class Claims
	include HTTParty
	base_uri 'https://data.cms.gov'
	

	def self.find_by_npi(npi)
		get('/resource/5fnr-qp4c.json', :query => {:npi => npi})
	end

	def self.procedures_index(npi)
		@npi = npi
		response = get('/resource/5fnr-qp4c.json', :query => {:npi => npi})
	end

end

puts Claims.find_by_npi(1104813138)