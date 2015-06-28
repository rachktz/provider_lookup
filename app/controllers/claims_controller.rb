require 'rubygems'
require 'httparty'

class ClaimsController < ApplicationController

	def index
		@npi = '1386821247'
		@claims = Claim.find_by_npi @npi
	end

end
