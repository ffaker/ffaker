# frozen_string_literal: true

module FFaker
  # Inspirations:
  # TERYT registry, available at: http://www.stat.gov.pl/broker/access/index.jspa
  module AddressPL
    extend ModuleUtils
    extend self

    STREET_PREFIXES = %w[al. ul.].freeze
    SQUARE_PREFIXES = %w[bulwar pasaż plac skwer zaułek].freeze

    # Full Polish address with country name in French (according to Universal Postal Union).
    def full_address(include_country = false, include_secondary = false)
      address = "#{street_address(include_secondary)} #{postal_code} #{city}"
      address = "#{address} POLOGNE" if include_country
      address
    end

    def street_address(include_secondary = false)
      address = "#{street_name} #{building_number}"
      address = "#{address}#{secondary_number}" if include_secondary
      address
    end

    def street_name
      fetch_sample([street, square])
    end

    def street
      "#{street_prefix} #{fetch_sample(STREET)}"
    end

    def square
      "#{square_prefix} #{fetch_sample(SQUARE)}"
    end

    # A voivodeship is an administrative area in Poland - a Polish equivalent of state.
    def voivodeship
      fetch_sample(VOIVODESHIP)
    end

    alias state voivodeship
    alias province voivodeship

    def voivodeship_abbr
      fetch_sample(VOIVODESHIP_ABBR)
    end

    def voivodeship_capital_city
      fetch_sample(VOIVODESHIP_CAPITAL_CITY)
    end

    def city
      fetch_sample(CITY)
    end

    def building_number # :nodoc:
      rand(1..199)
    end

    def secondary_number # :nodoc:
      case rand(0..1)
      when 0 then " m. #{building_number}"
      when 1 then "/#{building_number}"
      end
    end

    def zip_code
      FFaker.numerify('##-###')
    end

    alias postal_code zip_code

    def street_prefix
      fetch_sample(STREET_PREFIXES)
    end

    def square_prefix
      fetch_sample(SQUARE_PREFIXES)
    end
  end
end
