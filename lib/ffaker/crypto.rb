# frozen_string_literal: true

require 'openssl'

module FFaker
  module Crypto
    extend ModuleUtils
    extend self

    def sha256
      OpenSSL::Digest::SHA256.hexdigest(Lorem.characters)
    end
  end
end
