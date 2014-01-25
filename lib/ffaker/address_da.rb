# encoding: utf-8

require 'ffaker/address'

module Faker
  module AddressDA
    include Faker::Address

    extend ModuleUtils
    extend self

    def zip_code
      Faker.numerify ZIP_FORMATS.rand
    end

    def post_nr
      zip_code
    end

    def state
      kommune
    end

    def kommune
      KOMMUNE.rand
    end

    def region
      REGION.rand
    end

    def city
      CITY.rand
    end

    ZIP_FORMATS = k ['####']

    def street_name
      STREET.rand
    end

    def street_address
      "#{street_name} #{rand(100)}"
    end

    def full_address
      %Q{#{street_address} #{post_nr} #{city} #{region} DANMARK}
    end

    REGION = k [
      'Hovedstaden', 'Sjælland', 'Syddanmark', 'Midtjylland', 'Nordjylland'
    ]

    STATE = REGION
  end
end
