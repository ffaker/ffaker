# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressGR
    include FFaker::Address

    extend ModuleUtils
    extend self

    STREET_PREFIX = %w( Οδός Πάροδος )
    STREET_NUMBER = %w( # ## ### )
    STATE = REGION

    def zip_code
      FFaker.numerify '#####'
    end

    def region
      STATE.sample
    end

    def city
      CITY.sample
    end

    def street_name
      STREET.sample
    end

    def street_nbr
      FFaker.numerify STREET_NUMBER.sample
    end

    def street_address
      "#{STREET_PREFIX.sample} #{street_name}, #{street_nbr}"
    end
  end
end