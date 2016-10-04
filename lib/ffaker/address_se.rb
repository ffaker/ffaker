# encoding: utf-8

require 'ffaker/address'

module FFaker
  # List of countries from http://sv.wikipedia.org/wiki/V%C3%A4rldens_l%C3%A4nder#Lista_.C3.B6ver_l.C3.A4nder
  # The streetnames are all the roads in Stockholm that contains "väg" or "gata"
  # List of cities are from http://sv.wikipedia.org/wiki/Sveriges_kommuner
  module AddressSE
    include FFaker::Address

    extend ModuleUtils
    extend self

    ZIP_FORMATS = ['#####', '## ###'].freeze
    STREET_NBR_FORMATS = ['##', '#', '#a', '#b', '###'].freeze

    def zip_code
      FFaker.numerify(fetch_sample(ZIP_FORMATS))
    end

    def city
      fetch_sample(CITY)
    end

    def street_name
      fetch_sample(STREET)
    end

    def street_address
      "#{street_name} #{street_nbr}"
    end

    def street_nbr
      FFaker.numerify(fetch_sample(STREET_NBR_FORMATS))
    end

    def full_address
      "#{street_address}, #{zip_code} #{city}, SVERIGE"
    end

    def random_country
      fetch_sample(COUNTRIES)
    end
  end
end
