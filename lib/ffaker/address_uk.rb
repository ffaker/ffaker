# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressUK
    include FFaker::Address

    extend ModuleUtils
    extend self

    COUNTRY = ['England', 'Scotland', 'Wales', 'Northern Ireland']
    POSTCODE = ['??# #??', '??## #??']

    def county
      COUNTY.sample
    end

    def country
      COUNTRY.sample
    end

    def postcode
      FFaker.bothify(POSTCODE.sample).upcase
    end
  end
end
