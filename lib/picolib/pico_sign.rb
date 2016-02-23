module Picolib
  module PicoSign
    def self.decode_signed_request(signed_request, client_secret)
      encoded_signature, encoded_data = signed_request.split('.')
      signature = Base64.urlsafe_decode64(encoded_signature)
      expected_signature = OpenSSL::HMAC::digest('sha256', client_secret, encoded_data)
      if signature == expected_signature
        JSON.parse Base64.urlsafe_decode64(encoded_data)
      else
        false
      end
    end

    def self.encode_signed_request(payload, client_secret)
      encoded_data = Base64.urlsafe_encode64(payload)
      signature = OpenSSL::HMAC::digest('sha256', client_secret, encoded_data)
      encoded_signature = Base64.urlsafe_encode64(signature)
      [encoded_signature, encoded_data].join('.')
    end
  end
end
