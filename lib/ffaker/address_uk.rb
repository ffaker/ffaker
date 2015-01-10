# encoding: utf-8

require 'ffaker/address'

module Faker
  module AddressUK
    include Faker::Address

    extend ModuleUtils
    extend self

    def county
      COUNTY.sample
    end

    def country
      COUNTRY.sample
    end

    def postcode
      Faker.bothify(POSTCODE.sample).upcase
    end

    COUNTRY = k ['England', 'Scotland', 'Wales', 'Northern Ireland']
    POSTCODE = k ['??# #??', '??## #??']
  end
end
