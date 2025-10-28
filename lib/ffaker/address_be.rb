# frozen_string_literal: true

module FFaker
  module AddressBE
    include FFaker::Address

    extend ModuleUtils
    extend self

    STREET_NBR_FORMATS = ['##', '#', '#a', '#b', '###'].freeze

    def postal_code
      FFaker::String.from_regexp(/[1-9]\d{3}/)
    end

    def zip_code
      postal_code
    end

    def street_name
      name = fetch_sample([true, false]) ? NameNL.last_name : NameNL.first_name
      name + street_suffix
    end

    def street_address(include_secondary = false)
      str = "#{street_name} #{building_number}"
      str << ", #{appartment_number}" if include_secondary
      str
    end

    def street_suffix
      case rand(0..19)
      when 0 then 'weg'
      when 1 then 'steenweg'
      when 2 then 'baan'
      when 3 then 'pad'
      when 4 then 'laan'
      else 'straat'
      end
    end

    def building_number
      FFaker.numerify(fetch_sample(STREET_NBR_FORMATS))
    end

    def city
      fetch_sample(CITY)
    end

    def province
      fetch_sample(PROVINCE)
    end
  end
end
