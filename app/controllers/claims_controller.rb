require 'rubygems'
require 'httparty'

class ClaimsController < ApplicationController

	def index
		@npi = '1104813138'
		@claims = Claim.for @npi
	end

end
