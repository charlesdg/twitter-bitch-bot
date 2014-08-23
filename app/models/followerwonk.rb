require 'social_authority'

class Followerwonk < ActiveRecord::Base
	
	@@access_id = 'member-ZDNkNjE4OWItOTg1NS01ZmNmLWI3ZjQtMDlkNTM3NWI2ODBm'
	@@secret_key = 'gwx9tvbhxuzhlgfsbo99mjxeqpmybidn'


	def self.test(array)
		request = SocialAuthority::Request.new access_id: @@access_id, secret_key: @@secret_key
		
		request.users = nil
		request.users = array
		
		#  fetching api
  	request.get_data

  	# results
  	@data = request.data

  	p @data

  	@data
	end
		#http://api.followerwonk.com/social-authority?{screen_name};{user_id};{AccessID};{Timestamp};{Signature}
	  #https://api.followerwonk.com/social-authority?screen_name=randfish;AccessID=ACCESS_ID;Timestamp=TIMESTAMP;Signature=SIGNATURE_HMAC

end