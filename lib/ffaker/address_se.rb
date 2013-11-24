# encoding: utf-8

require 'ffaker/address'

module Faker

  # List of countries from http://sv.wikipedia.org/wiki/V%C3%A4rldens_l%C3%A4nder#Lista_.C3.B6ver_l.C3.A4nder
  # The streetnames are all the roads in Stockholm that contains "väg" or "gata"
  # List of cities are from http://sv.wikipedia.org/wiki/Sveriges_kommuner
  module AddressSE
    include Faker::Address

    extend ModuleUtils
    extend self

    def zip_code
      Faker.numerify ZIP_FORMATS.rand
    end

    def city
      CITY.rand
    end

    def street_name
      STREET.rand
    end

    def street_address
      "#{street_name} #{street_nbr}"
    end

    def street_nbr
      Faker.numerify STREET_NBR_FORMATS.rand
    end

    def full_address
      "#{street_address}, #{zip_code} #{city}, SVERIGE"
    end

    def random_country
      COUNTRIES.rand
    end

    ZIP_FORMATS = k ['#####', '## ###']

    STREET_NBR_FORMATS = k ['##', '#', '#a', '#b', '###']
  end
end
