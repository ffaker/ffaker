# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressUK
    include FFaker::Address

    extend ModuleUtils
    extend self

    COUNTRY = ['England', 'Scotland', 'Wales', 'Northern Ireland'].freeze
    POSTCODE = ['??# #??', '??## #??'].freeze

    def county
      fetch_sample(COUNTY)
    end

    def country
      fetch_sample(COUNTRY)
    end

    def postcode
      FFaker.bothify(fetch_sample(POSTCODE)).upcase
    end
  end
end
