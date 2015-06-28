require 'rubygems'
require 'httparty'

class Claim
	include HTTParty
	base_uri 'https://data.cms.gov'

	def self.find_by_npi npi
		get('/resource/5fnr-qp4c.json', :query => {:npi => npi})
	end

	def self.find_by_hcpcs_code hcpcs_code
		get('/resource/5fnr-qp4c.json', :query => {:hcpcs_code => hcpcs_code})
	end

end

claims = Claim.find_by_hcpcs_code "55700"
puts claims
