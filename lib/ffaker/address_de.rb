# encoding: utf-8

require 'ffaker/address'

module Faker
  module AddressDE
    include Faker::Address

    extend ModuleUtils
    extend self

    def zip_code
      Faker.numerify ZIP_FORMATS.rand
    end

    def state
      STATE.rand
    end

    def city
      CITY.rand
    end

    def street_name
      case rand(2)
      when 0 then "#{NameDE.last_name}"
      when 1 then "#{NameDE.first_name}"
      end << case rand(20)
      when 0 then "weg"
      when 1 then "gasse"
      when 3 then "hain"
      else "str."
      end
    end

    def street_address
      "#{street_name} #{1+rand(192)}"
    end

    ZIP_FORMATS = k ['#####']
  end
end
