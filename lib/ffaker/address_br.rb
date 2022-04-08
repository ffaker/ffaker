# frozen_string_literal: true

require_relative 'address'

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
    
    def complement
      FFaker.numerify(fetch_sample(COMPLEMENT))
    end

    def neighborhood
      prefix = fetch_sample(NEIGHBORHOOD_PREFIXES)
      "#{prefix} #{NameBR.first_name}"
    end

    def full_address(with_complement: false)
      if with_complement
        "#{street}, #{building_number}, #{complement}, #{neighborhood}, #{city}, #{state}, Brazil"
      else
      "#{street}, #{building_number}, #{neighborhood}, #{city}, #{state}, Brazil"
      end
    end

  end
end
