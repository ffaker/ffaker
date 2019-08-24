# frozen_string_literal: true

module FFaker
  # Inspirations:
  # https://pl.wikipedia.org/wiki/Numery_telefoniczne_w_Polsce
  # https://pl.wikipedia.org/wiki/Plan_numeracji_krajowej
  module PhoneNumberPL
    extend ModuleUtils

    module_function

    PHONE_NUMBER_FORMAT = '%s#######'
    COUNTRY_CODE = '+48'
    MOBILE_PREFIXES = %w[50 51 53 57 60 66 69 72 73 78 79 88].freeze
    AREA_CODES = %w[12 13 14 15 16 17 18 22 23 24 25 29 32 33
                    34 41 42 43 44 46 48 52 54 55 56 58 59 61
                    62 63 65 67 68 71 74 75 76 77 81 82 83 84
                    85 86 87 89 91 94 95].freeze

    def phone_number
      case rand(0..1)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def home_work_phone_number
      FFaker.numerify(phone_number_format)
    end

    def mobile_phone_number
      FFaker.numerify(mobile_phone_number_format)
    end

    def international_phone_number
      case rand(0..1)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end

    def international_mobile_phone_number
      FFaker.numerify("#{COUNTRY_CODE} #{mobile_phone_number_format}")
    end

    def international_home_work_phone_number
      FFaker.numerify("#{COUNTRY_CODE} #{phone_number_format}")
    end

    def area_code
      fetch_sample(AREA_CODES)
    end

    def mobile_prefix
      fetch_sample(MOBILE_PREFIXES)
    end

    def phone_number_format
      prefix = area_code
      PHONE_NUMBER_FORMAT % prefix
    end

    def mobile_phone_number_format
      prefix = mobile_prefix
      PHONE_NUMBER_FORMAT % prefix
    end
  end
end
