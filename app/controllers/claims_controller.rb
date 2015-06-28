require 'rubygems'
require 'httparty'

class ClaimsController < ApplicationController

	def index
		@npi = params[:npi]
		@claims = Claim.find_by_npi @npi
	end

end
