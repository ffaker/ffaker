# frozen_string_literal: true

module FFaker
  module PhoneNumberRU
    extend ModuleUtils
    extend self

    INTERNATIONAL_COUNTRY_PREFIX = '+7'
    COUNTRY_PREFIX = '8'
    TOLL_FREE_PREFIX = '800'

    # Generate general phone number with international country code
    #   +7 929 933 24 99
    #   +7 851 921 35 92
    #
    def international_phone_number
      case rand(0..1)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end

    # Generate mobile phone number with international country code
    #   +7 929 933 24 99
    #   +7 978 921 35 92
    #
    def international_mobile_phone_number
      build_phone_number(international_country_code, mobile_phone_prefix)
    end

    # Generate home or work phone number with international country code
    #   +7 842 933 24 99
    #   +7 851 921 35 92
    #
    def international_home_work_phone_number
      build_phone_number(international_country_code, home_work_phone_prefix)
    end

    # Generate toll free phone number with international country code
    #   +7 800 413 01 33
    #   +7 800 153 55 22
    #
    def international_toll_free_number
      build_phone_number(international_country_code, TOLL_FREE_PREFIX)
    end

    # Generate general phone number with internal country code
    #   8 999 044 31 33
    #   8 843 944 33 33
    #
    def phone_number
      case rand(0..1)
      when 0 then mobile_phone_number
      when 1 then home_work_phone_number
      end
    end

    # Generate mobile phone number with internal country code
    #   8 949 232 22 22
    #   8 999 331 23 12
    #
    def mobile_phone_number
      build_phone_number(country_code, mobile_phone_prefix)
    end

    # Generate home or work phone number with internal country code
    #   8 011 232 22 22
    #   8 836 331 23 12
    #
    def home_work_phone_number
      build_phone_number(country_code, home_work_phone_prefix)
    end

    # Generate toll free phone number with internal country code
    #   8 800 413 01 33
    #   8 800 153 55 22
    #
    def toll_free_number
      build_phone_number(country_code, TOLL_FREE_PREFIX)
    end

    # International country code
    #   +7
    #
    def international_country_code
      INTERNATIONAL_COUNTRY_PREFIX
    end

    # Internal country code
    #   8
    #
    def country_code
      COUNTRY_PREFIX
    end

    # Home or work phone prefix
    #  081
    #  301
    #
    def home_work_phone_prefix
      fetch_sample(HOME_PHONE_PREFIXES)
    end

    # Mobile phone prefix
    #  929
    #  978
    #
    def mobile_phone_prefix
      fetch_sample(MOBILE_PHONE_PREFIXES)
    end

    private

    # Build phone number by country_code and prefix
    #
    def build_phone_number(country_code, prefix)
      "#{country_code} #{prefix} #{FFaker.numerify('###-##-##')}"
    end
  end
end
