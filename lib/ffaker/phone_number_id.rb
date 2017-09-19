# frozen_string_literal: true
# encoding: utf-8

module FFaker
  module PhoneNumberID
    extend ModuleUtils
    extend self

    COUNTRY_CODE = '+62'.freeze

    def mobile_phone_number
      "#{fetch_sample(MOBILE_PHONE_PREFIXES)}-#{FFaker.numerify('########')}"
    end

    def home_phone_number
      digit_nums = '#' * rand(7..8)

      "#{fetch_sample(HOME_PHONE_PREFIXES)}-#{FFaker.numerify(digit_nums)}"
    end

    def phone_number
      case rand(0..1)
      when 0 then home_phone_number
      when 1 then mobile_phone_number
      end
    end

    def international_mobile_phone_number
      mobile_phone_number.sub('0', COUNTRY_CODE)
    end

    def international_home_phone_number
      home_phone_number.sub('0', COUNTRY_CODE)
    end

    def international_phone_number
      phone_number.sub('0', COUNTRY_CODE)
    end
  end
end
