# encoding: utf-8

require 'ffaker/address'

module Faker
  module AddressUK
    include Faker::Address

    extend ModuleUtils
    extend self

    def county
      COUNTY.rand
    end

    def country
      COUNTRY.rand
    end

    def postcode
      Faker.bothify(POSTCODE.rand).upcase
    end

    COUNTRY = k ['England', 'Scotland', 'Wales', 'Northern Ireland']
    POSTCODE = k ['??# #??', '??## #??']
  end
end
