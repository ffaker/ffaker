# encoding: utf-8

module Faker

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

    PHONE_FORMAT_PREFIX_2 = ["%s-### ### ##",
                             "%s-### ## ##",
                             "%s-## ## ##"]
    PHONE_FORMAT_PREFIX_3 = ["%s-### ## ##",
                             "%s-## ## ##",
                             "%s-## ###"]
    PHONE_FORMAT_PREFIX_4 = ["%s-## ## ##",
                             "%s-### ##"]
    MOBILE_PHONE_FORMAT = ["%s#-## ## ##", "%s#-######"]
    COUNTRY_PREFIX = ["+46", "0046"]
    MOBILE_PHONE_PREFIX = %w(70 72 73 76 74)

    def phone_number
      case rand(2)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def home_work_phone_number
      Faker.numerify("0#{phone_number_format}")
    end

    def mobile_phone_number
      Faker.numerify("0#{mobile_phone_number_format}")
    end

    def international_phone_number
      case rand(2)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end

    def country_prefix
      COUNTRY_PREFIX.sample
    end

    def international_mobile_phone_number
      Faker.numerify("#{country_prefix} (0)#{mobile_phone_number_format}")
    end

    def international_home_work_phone_number
      Faker.numerify("#{country_prefix} (0)#{phone_number_format}")
    end

    def area_prefix
      PHONE_PREFIX.sample
    end

    def phone_number_format
      prefix = area_prefix
      case prefix.length
      when 1 then PHONE_FORMAT_PREFIX_2.sample
      when 2 then PHONE_FORMAT_PREFIX_3.sample
      when 3 then PHONE_FORMAT_PREFIX_4.sample
      end % prefix
    end

    def mobile_prefix
      MOBILE_PHONE_PREFIX.sample
    end

    def mobile_phone_number_format
      MOBILE_PHONE_FORMAT.sample % mobile_prefix
    end
  end
end
