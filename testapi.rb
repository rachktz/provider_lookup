require 'rubygems'
require 'httparty'

class Claims
	include HTTParty
	base_uri 'https://data.cms.gov'
	attr_accessor :npi, :first_name, :last_name, :procedure_name, :procedure_count

	def initialize(npi, first_name, last_name, procedure_name, procedure_count)
		self.npi = npi
		self.first_name = first_name
		self.last_name = last_name
		self.procedure_name = procedure_name
		self.procedure_count = procedure_count
	end

	def self.find_by_npi(npi)
		get('/resource/5fnr-qp4c.json', :query => {:npi => npi})
	end

	def self.procedures_index(npi)
		@npi = npi
		response = get('/resource/5fnr-qp4c.json', :query => {:npi => npi})
	end

end

puts Claims.find_by_npi(1104813138)