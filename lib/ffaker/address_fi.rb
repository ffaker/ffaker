# encoding: utf-8

require 'ffaker/address'

module FFaker
  # List of countries is from Freebase:
  # https://www.googleapis.com/freebase/v1/mqlread?lang=/lang/fi&query=[%7B%22name%22:null,%22type%22:%22/location/country%22%7D]
  # Streetnames are from areacode 32100 (http://posti.fi/postipalvelee/tyokalut/postinumerohaku/)
  # List of cities is from http://fi.wikipedia.org/wiki/Luettelo_Suomen_kaupungeista
  module AddressFI
    include FFaker::Address

    extend ModuleUtils
    extend self

    def zip_code
      FFaker.numerify ZIP_FORMATS.rand
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
      FFaker.numerify STREET_NBR_FORMATS.rand
    end

    def full_address
      "#{street_address}, #{zip_code} #{city}, SUOMI"
    end

    def random_country
      COUNTRIES.rand
    end

    ZIP_FORMATS = k ['#####']

    STREET_NBR_FORMATS = k ['##', '#', '# a', '# b', '###', '# a #', '# b #']
  end
end
