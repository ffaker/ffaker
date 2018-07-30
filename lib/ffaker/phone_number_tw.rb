# frozen_string_literal: true
# encoding: utf-8

module FFaker
  module PhoneNumberTW
    extend ModuleUtils
    extend self

    HOME_PHONE_PREFIXES = %w[02 03 04 05 06 07 08].freeze
    MOBILE_PHONE_PREFIX = '09'.freeze

    def phone_number
      case rand(0..1)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def home_work_phone_number
      prefix = fetch_sample(HOME_PHONE_PREFIXES)
      case prefix
      when '02', '04'
        FFaker.numerify("(#{prefix}) ####-####")
      else
        FFaker.numerify("(#{prefix}) ###-####")
      end
    end

    def mobile_phone_number
      FFaker.numerify("#{MOBILE_PHONE_PREFIX}##-###-###")
    end

    def contry_code
      '+886'
    end

    def international_mobile_phone_number
      number = mobile_phone_number
      number[0] = "#{contry_code}-"
      number
    end

    def international_home_work_phone_number
      number = home_work_phone_number
      number[0..4] = "#{contry_code}-#{number[2]}-"
      number
    end

    def international_phone_number
      case rand(0..1)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end
  end
end
