require 'ffaker/address'

module FFaker
  module AddressKR
    extend ModuleUtils
    extend self

    BUILDING_DONGS = %w(가 나 다 라 마 바 ## ###)
    BUILDING_SUFFIXES = %w(빌라 아파트 연립 마을 타운 타워)
    STREET_SUFFIXES = %w(로 #로 가 #가 거리 길)
    TOWN_SUFFIXES = %w(동 리 마을)
    METROPOLITAN_CITIES = %w(서울특별시 부산광역시 대구광역시 인천광역시
                             광주광역시 대전광역시 울산광역시 세종특별자치시)
    PROVINCES = %w(경기도 강원도 충청북도 충청남도 전라북도 전라남도 경상북도
                   경상남도 제주특별자치도)

    # ex) 12345
    def postal_code
      FFaker.numerify('#####')
    end

    # ex) 123-456
    def old_postal_code
      FFaker.numerify('###-###')
    end

    # ex) 서울특별시 중구 민정2로
    def road_addess
      fetch_sample([
        "#{metropolitan_city} #{borough} #{street}",
        "#{province} #{borough} #{street}",
        "#{metropolitan_city} #{borough} #{street} (#{town})",
        "#{province} #{borough} #{street} (#{town})"
      ])
    end

    # ex) 경기도 고양시 포남동 112-1
    def land_address
      fetch_sample([
        "#{metropolitan_city} #{borough} #{town} #{land_number}",
        "#{province} #{town} #{land_number}"
      ])
    end

    # ex) 112
    def land_number
      FFaker.numerify(fetch_sample([
        '###',
        '###-#',
        '###-##',
        '####',
        '####-#'
      ]))
    end

    # ex) 은영아파트
    def building_name
      "#{NameKR.first_name}#{fetch_sample(BUILDING_SUFFIXES)}"
    end

    # ex) 진빌딩 가동 123호
    def address_detail
      FFaker.numerify(fetch_sample([
        building_name,
        "#{building_name} ###호",
        "#{building_name} #{fetch_sample(BUILDING_DONGS)} ###호",
      ]))
    end

    # ex) 가영3로
    def street
      FFaker.numerify("#{NameKR.first_name}#{fetch_sample(BUILDING_SUFFIXES)}")
    end

    # ex) 철수동
    def town
      "#{NameKR.first_name}#{fetch_sample(TOWN_SUFFIXES)}"
    end

    # ex) 북구
    def borough
      fetch_sample(BOROUGHS)
    end

    # ex) 용인시
    def city
      fetch_sample(CITIES)
    end

    # ex) 강원도
    def province
      fetch_sample(PROVINCES)
    end

    # ex) 세종특별자치시
    def metropolitan_city
      fetch_sample(METROPOLITAN_CITIES)
    end
  end
end
