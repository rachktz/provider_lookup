require 'rubygems'
require 'httparty'

class Claim
	include HTTParty
	base_uri 'https://data.cms.gov'
	#default_params :output => "json"
	#format :json

	def self.for npi
		get('/resource/5fnr-qp4c.json', :query => {:npi => npi})#["results"]
	end
end

puts Claim.for 1104813138
puts @claims[0]["nppes_provider_first_name"] @claims[0]["nppes_provider_last_name"]