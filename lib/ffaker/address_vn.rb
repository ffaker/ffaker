# frozen_string_literal: true

module FFaker
  # Based on information from https://en.wikipedia.org/wiki/Administrative_divisions_of_Vietnam
  module AddressVN
    include FFaker::Address

    extend ModuleUtils
    extend self

    STREET_PREFIXES = %w[Đường Phố Ngõ Hẻm].freeze
    STREET_NAMES = [
      'Lê Lợi', 'Nguyễn Huệ', 'Trần Hưng Đạo', 'Đinh Tiên Hoàng',
      'Lý Thái Tổ', 'Nguyễn Du', 'Phan Chu Trinh', 'Bà Triệu',
      'Lê Duẩn', 'Hai Bà Trưng', 'Nguyễn Thị Minh Khai',
      'Võ Thị Sáu', 'Cách Mạng Tháng Tám', 'Phạm Ngọc Thạch',
      'Lê Văn Sỹ', 'Hoàng Diệu', 'Phan Đình Phùng',
      'Quang Trung', 'Lê Thánh Tôn', 'Nguyễn Trãi', 'Hùng Vương'
    ].freeze

    def province
      fetch_sample(PROVINCE)
    end

    def province_abbr
      fetch_sample(PROVINCE_ABBR)
    end

    def city
      fetch_sample(CITY)
    end

    def street_prefix
      fetch_sample(STREET_PREFIXES)
    end

    def street_name
      fetch_sample(STREET_NAMES)
    end

    def street_address
      "#{rand(1..999)} #{street_prefix} #{street_name}"
    end

    def zip_code
      FFaker.numerify('######')
    end
  end
end
