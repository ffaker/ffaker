# encoding: utf-8

module FFaker
  # Format for swedish numbers, from here
  # from http://sv.wikipedia.org/wiki/Telefonnummer
  #
  # All area codes are from this list
  # http://sv.wikipedia.org/wiki/Lista_%C3%B6ver_svenska_riktnummer
  #
  # - Length 9
  #   08-xxx xxx xx, 0xx-xxx xx xx, 0xxx-xx xx xx
  # - Length 8
  #   08-xxx xx xx, 0xx-xx xx xx, 0xxx-xxx xx
  # - Length 7
  #   08-xx xx xx, 0xx-xxx xx
  #
  module PhoneNumberSE
    extend ModuleUtils
    extend self

    PHONE_FORMAT_PREFIX_2 = ['%s-### ### ##',
                             '%s-### ## ##',
                             '%s-## ## ##'].freeze
    PHONE_FORMAT_PREFIX_3 = ['%s-### ## ##',
                             '%s-## ## ##',
                             '%s-## ###'].freeze
    PHONE_FORMAT_PREFIX_4 = ['%s-## ## ##',
                             '%s-### ##'].freeze
    MOBILE_PHONE_FORMAT = ['%s#-## ## ##', '%s#-######'].freeze
    COUNTRY_PREFIX = ['+46', '0046'].freeze
    MOBILE_PHONE_PREFIX = %w[70 72 73 76 74].freeze

    def phone_number
      case rand(0..1)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def home_work_phone_number
      FFaker.numerify("0#{phone_number_format}")
    end

    def mobile_phone_number
      FFaker.numerify("0#{mobile_phone_number_format}")
    end

    def international_phone_number
      case rand(0..1)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end

    def country_prefix
      fetch_sample(COUNTRY_PREFIX)
    end

    def international_mobile_phone_number
      FFaker.numerify("#{country_prefix} (0)#{mobile_phone_number_format}")
    end

    def international_home_work_phone_number
      FFaker.numerify("#{country_prefix} (0)#{phone_number_format}")
    end

    def area_prefix
      fetch_sample(PHONE_PREFIX)
    end

    def phone_number_format
      prefix = area_prefix
      case prefix.length
      when 1 then fetch_sample(PHONE_FORMAT_PREFIX_2)
      when 2 then fetch_sample(PHONE_FORMAT_PREFIX_3)
      when 3 then fetch_sample(PHONE_FORMAT_PREFIX_4)
      end % prefix
    end

    def mobile_prefix
      fetch_sample(MOBILE_PHONE_PREFIX)
    end

    def mobile_phone_number_format
      fetch_sample(MOBILE_PHONE_FORMAT) % mobile_prefix
    end
  end
end
