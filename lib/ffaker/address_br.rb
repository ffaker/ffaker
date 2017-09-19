# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressBR
    include FFaker::Address

    extend ModuleUtils
    extend self

    STREET_PREFIX = %w[Rua Avenida Travessa Alameda].freeze

    def zip_code
      FFaker.numerify '#####-###'
    end

    def state
      fetch_sample(STATE)
    end

    def state_abbr
      fetch_sample(STATE_ABBR)
    end

    def city
      fetch_sample(CITY)
    end

    def street_prefix
      fetch_sample(STREET_PREFIX)
    end

    def street
      case rand(0..1)
      when 0 then "#{street_prefix} #{NameBR.name}"
      when 1 then "#{street_prefix} #{NameBR.first_name} #{NameBR.last_name} #{NameBR.last_name}"
      end
    end

    def full_address
      "#{street}, #{building_number}, #{city}, #{state}, Brazil"
    end
  end
end
