# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressCH
    include FFaker::Address

    extend ModuleUtils
    extend self

    POSTAL_CODE_FORMAT = ['####']

    def postal_code
      FFaker.numerify POSTAL_CODE_FORMAT.sample
    end

    def canton_abbr
      CANTON_ABBR.sample
    end
  end
end
