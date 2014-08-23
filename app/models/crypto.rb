require 'openssl'
require 'base64'

class Crypto < ActiveRecord::Base

  def self.generate_signature(access_id, secret_key, expiration=nil)
    expiration ||= Time.now.to_i + 300
    to_sign = "#{access_id}\n#{expiration}"
    CGI::escape( Base64.encode64(HMAC::SHA1.digest(secret_key, to_sign)).chomp)
  end

end