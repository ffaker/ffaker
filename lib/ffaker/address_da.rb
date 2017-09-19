# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressDA
    include FFaker::Address

    extend ModuleUtils
    extend self

    REGION = %w[Hovedstaden Sjælland Syddanmark Midtjylland Nordjylland].freeze
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
      fetch_sample(KOMMUNE)
    end

    def region
      fetch_sample(REGION)
    end

    def city
      fetch_sample(CITY)
    end

    def street_name
      fetch_sample(STREET)
    end

    def street_address
      "#{street_name} #{rand(0..99)}"
    end

    def full_address
      "#{street_address} #{post_nr} #{city} #{region} DANMARK"
    end
  end
end
