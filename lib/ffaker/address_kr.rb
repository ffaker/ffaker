# encoding: utf-8
# frozen_string_literal: true

module FFaker
  module AddressKR
    extend ModuleUtils
    extend self

    BUILDING_DONGS = %w[가 나 다 라 마 바 ## ###].freeze
    BUILDING_SUFFIXES = %w[빌라 아파트 연립 마을 타운 타워].freeze
    STREET_SUFFIXES = %w[로 #로 가 #가 거리 길].freeze
    TOWN_SUFFIXES = %w[동 리 마을].freeze
    METROPOLITAN_CITIES = %w[서울특별시 부산광역시 대구광역시 인천광역시
                             광주광역시 대전광역시 울산광역시 세종특별자치시].freeze
    PROVINCES = %w[경기도 강원도 충청북도 충청남도 전라북도 전라남도 경상북도
                   경상남도 제주특별자치도].freeze

    def postal_code
      FFaker.numerify('#####')
    end

    def old_postal_code
      FFaker.numerify('###-###')
    end

    def road_addess
      fetch_sample([
                     "#{metropolitan_city} #{borough} #{street}",
                     "#{province} #{town} #{street}",
                     "#{metropolitan_city} #{borough} #{street} (#{town})",
                     "#{province} #{town} #{street} (#{town})"
                   ])
    end

    def land_address
      fetch_sample([
                     "#{metropolitan_city} #{borough} #{town} #{land_number}",
                     "#{province} #{town} #{land_number}"
                   ])
    end

    def land_number
      FFaker.numerify(fetch_sample([
                                     '###',
                                     '###-#',
                                     '###-##',
                                     '####',
                                     '####-#'
                                   ]))
    end

    def building_name
      "#{NameKR.first_name}#{fetch_sample(BUILDING_SUFFIXES)}"
    end

    def address_detail
      FFaker.numerify(fetch_sample([
                                     building_name,
                                     "#{building_name} ###호",
                                     "#{building_name} #{fetch_sample(BUILDING_DONGS)} ###호"
                                   ]))
    end

    def street
      FFaker.numerify("#{NameKR.first_name}#{fetch_sample(STREET_SUFFIXES)}")
    end

    def town
      "#{NameKR.first_name}#{fetch_sample(TOWN_SUFFIXES)}"
    end

    def borough
      fetch_sample(BOROUGHS)
    end

    def city
      fetch_sample(CITIES)
    end

    def province
      fetch_sample(PROVINCES)
    end

    def metropolitan_city
      fetch_sample(METROPOLITAN_CITIES)
    end
  end
end
