# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressUK
    include FFaker::Address

    extend ModuleUtils
    extend self

    def county
      COUNTY.rand
    end

    def country
      COUNTRY.rand
    end

    def postcode
      FFaker.bothify(POSTCODE.rand).upcase
    end

    COUNTRY = k ['England', 'Scotland', 'Wales', 'Northern Ireland']
    POSTCODE = k ['??# #??', '??## #??']
  end
end
