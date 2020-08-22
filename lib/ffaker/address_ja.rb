# frozen_string_literal: true

module FFaker
  module AddressJA
    include FFaker::Address

    extend ModuleUtils
    extend self

    ZIP_FORMATS = ['###-####'].freeze
    LAND_NUMBER_FORMATS = ['#丁目#番#号', '###'].freeze

    def address
      fetch_sample([
                     "#{postal_code} #{prefecture}#{city}#{street}#{land_number}",
                     "#{postal_code} #{prefecture}#{county}#{street}#{land_number}",
                     "#{postal_code} #{prefecture}#{designated_city}#{ward}#{street}#{land_number}",
                     "#{postal_code} 東京都#{tokyo_ward}#{street}#{land_number}"
                   ])
    end

    def other_address
      fetch_sample([
                     "#{postal_code} #{prefecture}#{city}#{street}#{land_number}",
                     "#{postal_code} #{prefecture}#{county}#{street}#{land_number}"
                   ])
    end

    def designated_city_address
      fetch_sample([
                     # 愛知県名古屋市中区錦3丁目24番4号
                     "#{postal_code} #{prefecture}#{designated_city}#{ward}#{street}#{land_number}"
                   ])
    end

    def tokyo_ward_address
      fetch_sample([
                     # 東京都千代田区永田町2丁目2番1号
                     "#{postal_code} 東京都#{tokyo_ward}#{street}#{land_number}"
                   ])
    end

    def postal_code
      FFaker.numerify(fetch_sample(ZIP_FORMATS))
    end

    def land_number
      FFaker.numerify(fetch_sample(LAND_NUMBER_FORMATS))
    end

    def street
      FFaker.numerify(fetch_sample(CITY))
    end

    def tokyo_ward
      fetch_sample(TOKYO_WARD)
    end

    def ward
      fetch_sample(WARD)
    end

    def village
      fetch_sample(VILLAGE)
    end

    def designated_city
      fetch_sample(CITY)
    end

    def city
      fetch_sample(CITY)
    end

    def county
      fetch_sample(COUNTY)
    end

    def prefecture
      fetch_sample(PREFECTURE)
    end
  end
end
