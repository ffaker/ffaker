# encoding: utf-8

require 'ffaker/address'

module Faker
  module AddressUK
    include Faker::Address

    extend ModuleUtils
    extend self

    def county
      UK_COUNTY.rand
    end

    def country
      UK_COUNTRY.rand
    end

    def postcode
      Faker.bothify(UK_POSTCODE.rand).upcase
    end

    UK_COUNTRY = k ['England', 'Scotland', 'Wales', 'Northern Ireland']
    UK_POSTCODE = k ['??# #??', '??## #??']
  end
end
