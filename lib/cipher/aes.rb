require "base64"                                                                        
include Base64   

module Cipher
  class AES

    @key = Digest::MD5.digest("key123Key321")
    @iv = Digest::MD5.digest("iv123IV321")

    def self.decrypt(cipher_text = "")
      cipher_text = urlsafe_decode64(cipher_text)
      cipher = OpenSSL::Cipher::AES.new(128, :CBC)
      cipher.decrypt
      cipher.key = @key
      cipher.iv = @iv
      decrypted_plain_text = cipher.update(cipher_text) + cipher.final
      
    end

    def self.encrypt(plain_text = "")      
      cipher = OpenSSL::Cipher::AES.new(128, :CBC)
      cipher.encrypt
      cipher.key = @key
      cipher.iv = @iv
      cipher_text = cipher.update(plain_text) + cipher.final  
      urlsafe_encode64(cipher_text)
    end
  end
end
