# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressDA
    include FFaker::Address

    extend ModuleUtils
    extend self

    REGION = %w(Hovedstaden Sjælland Syddanmark Midtjylland Nordjylland)
    STATE = REGION

    def zip_code
      FFaker.numerify('####')
    end

    def post_nr
      zip_code
    end

    def state
      kommune
    end

    def kommune
      KOMMUNE.sample
    end

    def region
      REGION.sample
    end

    def city
      CITY.sample
    end

    def street_name
      STREET.sample
    end

    def street_address
      "#{street_name} #{rand(100)}"
    end

    def full_address
      "#{street_address} #{post_nr} #{city} #{region} DANMARK"
    end
  end
end
