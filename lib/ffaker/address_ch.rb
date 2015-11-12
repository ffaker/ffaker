# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressCH
    include FFaker::Address

    extend ModuleUtils
    extend self


    def postal_code
      FFaker.numerify '####'
    end

    def canton_abbr
      CANTON_ABBR.sample
    end
  end
end
