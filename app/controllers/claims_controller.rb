require 'rubygems'
require 'httparty'

class ClaimsController < ApplicationController

	def index
		@npi = params[:npi]
		@claims = Claim.find_by_npi @npi
		@claims_sort = @claims.sort_by { |h| h["line_srvc_cnt"].to_i }.reverse
	end

end
