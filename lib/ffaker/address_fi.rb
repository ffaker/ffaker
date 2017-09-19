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

    STREET_NBR_FORMATS = ['##', '#', '# a', '# b', '###', '# a #', '# b #'].freeze

    def zip_code
      FFaker.numerify('#####')
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
      "#{street_address}, #{zip_code} #{city}, SUOMI"
    end

    def random_country
      fetch_sample(COUNTRIES)
    end
  end
end
