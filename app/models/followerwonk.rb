class Followerwonk < ActiveRecord::Base
	
	@@access_id = 'member-ZDNkNjE4OWItOTg1NS01ZmNmLWI3ZjQtMDlkNTM3NWI2ODBm'
	@@secret_key = 'gwx9tvbhxuzhlgfsbo99mjxeqpmybidn'

	def self.get_social_authority(users)

		timestamp = Time.now.to_i + 500

		url = 'https://api.followerwonk.com/social-authority'
    # users
    url << "?screen_name=#{users.join(',')};"
    # auth
    signature = Crypto.generate_signature(@@access_id, @@secret_key, timestamp)
    url << "AccessID=#{@@access_id};Timestamp=#{timestamp};Signature=#{signature}"

    response = HTTParty.get(url)

    data = response["_embedded"].collect do |user|
        {
          user_id: user["user_id"],
          social_authority: user["social_authority"],
          screen_name: user["screen_name"]
        }   
      end

    puts data

    data
  end
		#http://api.followerwonk.com/social-authority?{screen_name};{user_id};{AccessID};{Timestamp};{Signature}
	  #https://api.followerwonk.com/social-authority?screen_name=randfish;AccessID=ACCESS_ID;Timestamp=TIMESTAMP;Signature=SIGNATURE_HMAC

	end