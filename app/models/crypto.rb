require 'base64'
require 'openssl'
require 'cgi'
#require 'hmac-sha1'
#require 'httparty'

class Crypto < ActiveRecord::Base

  def self.generate_signature(access_id, secret_key, expiration=nil)
    expiration ||= Time.now.to_i + 300
    to_sign = "#{access_id}\n#{expiration}"

    CGI::escape( Base64.encode64(OpenSSL::HMAC.digest('sha1',secret_key, to_sign)).chomp)
  end

end