require 'rubygems'
require 'httparty'

class Claim
	include HTTParty
	base_uri 'https://data.cms.gov'

	def self.find_by_npi npi
		get('/resource/5fnr-qp4c.json', :query => {:npi => npi})
	end

	def self.avg_charge (procedure_code, place)
		resource = get('/resource/5fnr-qp4c.json', query: {hcpcs_code: procedure_code, place_of_service: place})
		@avg_charge = (resource.inject(0) { |result, x| result + x["average_submitted_chrg_amt"].to_f })/resource.length
	end

	def self.avg_payment (procedure_code, place)
		resource = get('/resource/5fnr-qp4c.json', query: {hcpcs_code: procedure_code, place_of_service: place})
		@avg_payment = (resource.inject(0) { |result, x| result + x["average_medicare_payment_amt"].to_f })/resource.length
	end
end

