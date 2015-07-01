require 'rubygems'
require 'httparty'

class Average

	include HTTParty
	base_uri 'https://data.cms.gov'

	# list unique claims
	resource = get('/resource/5fnr-qp4c.json')
	unique_claims = resource.map { |h| h["hcpcs_code"] }.uniq

	# define empty hashes
	avg_charge_hash = Hash.new
	avg_payment_hash = Hash.new
	
	# calculate average charge and average payment in facility for each unique claim type
	unique_claims.each do |claim|
		resource = get('/resource/5fnr-qp4c.json', query: {hcpcs_code: claim, place_of_service: "F"})
		if (resource.length != 0)
			avg_charge_F = (resource.inject(0) { |result, x| result + x["average_submitted_chrg_amt"].to_f })/resource.length
			avg_payment_F = (resource.inject(0) { |result, x| result + x["average_medicare_payment_amt"].to_f })/resource.length
		else
			avg_charge_F = 0
			avg_payment_F = 0
		end
		avg_charge_hash["#{claim}_charge_F"] = avg_charge_F
		avg_payment_hash["#{claim}_payment_F"] = avg_payment_F
	end
	
	puts avg_charge_hash
	puts avg_charge_hash.length
	puts avg_payment_hash
	puts avg_payment_hash.length

	# calculate average charge and average payment outside of facility or each unique claim type
	unique_claims.each do |claim|
		resource = get('/resource/5fnr-qp4c.json', query: {hcpcs_code: claim, place_of_service: "O"})
		if (resource.length != 0)
			avg_charge_O = (resource.inject(0) { |result, x| result + x["average_submitted_chrg_amt"].to_f })/resource.length
			avg_payment_O = (resource.inject(0) { |result, x| result + x["average_medicare_payment_amt"].to_f })/resource.length
		else
			avg_charge_O = 0
			avg_payment_O = 0
		end
		avg_charge_hash["#{claim}_charge_O"] = avg_charge_O
		avg_payment_hash["#{claim}_payment_O"] = avg_payment_O
	end
	
	puts avg_charge_hash
	puts avg_charge_hash.length
	puts avg_payment_hash
	puts avg_payment_hash.length
	
end


#<%= number_to_currency(Claim.avg_charge claim["hcpcs_code"], claim["place_of_service"]) %>
#<%= number_to_currency(Claim.avg_payment claim["hcpcs_code"], claim["place_of_service"]) %>

