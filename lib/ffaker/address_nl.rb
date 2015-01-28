# encoding: utf-8

require 'ffaker/address'

module Faker
  module AddressNL
    include Faker::Address

    extend ModuleUtils
    extend self

    POSTAL_CODE_FORMAT = ['#### ??']

    def postal_code
      Faker.bothify POSTAL_CODE_FORMAT
    end

    def zip_code
      postal_code
    end

    def street_name
      case rand(2)
      when 0 then "#{NameNL.last_name}"
      when 1 then "#{NameNL.first_name}"
      end << case rand(20)
      when 0 then "weg"
      when 1 then "boulevard"
      when 3 then "pad"
      when 4 then "steeg"
      else "straat"
      end
    end

    def city
      CITY.sample
    end

    def province
      PROVINCE.sample
    end
  end
end
