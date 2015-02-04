# encoding: utf-8

require 'ffaker/address'

module Faker
  module AddressCA
    include Faker::Address

    extend ModuleUtils
    extend self

    POSTAL_CODE_FORMATS = ['?#? #?#']
    PROVINCE_ABBRS = %w(NL NS PE NB QC ON MB SK AB BC YT NT NU)

    def postal_code
      Faker.bothify(POSTAL_CODE_FORMATS.sample).upcase
    end

    def province
      PROVINCE.sample
    end

    def city
      CITY.sample
    end

    def province_abbr
      PROVINCE_ABBRS.sample
    end

  end
end
