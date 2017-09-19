# encoding: utf-8

module FFaker
  module Address
    extend ModuleUtils
    extend self

    COMPASS_DIRECTIONS = %w[North East West South].freeze
    CITY_PREFIXES = COMPASS_DIRECTIONS + %w[New Lake Port]
    SEC_ADDR = ['Apt. ###', 'Suite ###'].freeze

    # @deprecated US specific address info. Moved into {AddressUS}
    def zip_code
      warn '[zip_code] is deprecated. For US addresses please use the AddressUS module'
      FFaker::AddressUS.zip_code
    end

    def us_state
      warn '[us_state] is deprecated. For US addresses please use the AddressUS module'
      FFaker::AddressUS.state
    end

    def us_state_abbr
      warn '[state_abbr] is deprecated. For US addresses please use the AddressUS module'
      FFaker::AddressUS.state_abbr
    end
    # end US deprecation

    def city_prefix
      fetch_sample(CITY_PREFIXES)
    end

    def city_suffix
      fetch_sample(CITY_SUFFIXES)
    end

    def city
      case rand(0..3)
      when 0 then format('%s %s%s', city_prefix, Name.first_name, city_suffix)
      when 1 then format('%s %s', city_prefix, Name.first_name)
      when 2 then format('%s%s', Name.first_name, city_suffix)
      when 3 then format('%s%s', Name.last_name, city_suffix)
      end
    end

    def street_suffix
      fetch_sample(STREET_SUFFIX)
    end

    def building_number
      FFaker.numerify(('#' * rand(0..2)) << '###')
    end

    def street_name
      case rand(0..1)
      when 0 then "#{Name.last_name} #{street_suffix}"
      when 1 then "#{Name.first_name} #{street_suffix}"
      end
    end

    def street_address(include_secondary = false)
      str = "#{building_number} #{street_name}"
      str << " #{secondary_address}" if include_secondary
      str
    end

    def secondary_address
      FFaker.numerify(fetch_sample(SEC_ADDR))
    end

    # @deprecated UK specific address info. Moved into {AddressUK}
    # UK Variants
    def uk_county
      warn '[uk_county] is deprecated. For UK addresses please use the AddressUK module'
      FFaker::AddressUK.county
    end

    def uk_country
      warn '[uk_country] is deprecated. For UK addresses please use the AddressUK module'
      FFaker::AddressUK.country
    end

    def uk_postcode
      warn '[uk_postcode] is deprecated. For UK addresses please use the AddressUK module'
      FFaker::AddressUK.postcode
    end
    # end UK deprecation

    def neighborhood
      fetch_sample(NEIGHBORHOOD)
    end

    def country(given_code = nil)
      country_index = COUNTRY_CODE.index(given_code)
      if given_code && country_index
        COUNTRY[country_index]
      else
        fetch_sample(COUNTRY)
      end
    end

    def country_code(given_country = nil)
      code_index = COUNTRY.index(given_country)
      if given_country && code_index
        COUNTRY_CODE[code_index]
      else
        fetch_sample(COUNTRY_CODE)
      end
    end

    def time_zone
      fetch_sample(TIME_ZONE)
    end
  end
end
