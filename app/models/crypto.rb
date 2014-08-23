require 'openssl'
require 'base64'

class Crypto < ActiveRecord::Base

	def self.hmac(key, data)
		hmac = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('sha1'), key, data)
		enc =  Base64.encode64(hmac)

		enc
	end

end