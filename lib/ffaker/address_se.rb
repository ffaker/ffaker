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

    ZIP_FORMATS = ['#####', '## ###']
    STREET_NBR_FORMATS = ['##', '#', '#a', '#b', '###']

    def zip_code
      Faker.numerify ZIP_FORMATS.sample
    end

    def city
      CITY.sample
    end

    def street_name
      STREET.sample
    end

    def street_address
      "#{street_name} #{street_nbr}"
    end

    def street_nbr
      Faker.numerify STREET_NBR_FORMATS.sample
    end

    def full_address
      "#{street_address}, #{zip_code} #{city}, SVERIGE"
    end

    def random_country
      COUNTRIES.sample
    end
  end
end
