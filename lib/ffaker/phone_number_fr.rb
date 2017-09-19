# encoding: utf-8

module FFaker
  module PhoneNumberFR
    extend ModuleUtils
    extend self

    COUNTRY_PREFIX = %w[+33 0033 0].freeze
    AREA_PREFIX = %w[1 2 3 4 5].freeze
    MOBILE_PREFIX = %w[6 7].freeze
    PHONE_NUMBER = ['########', ' ## ## ## ##'].freeze

    def phone_number
      case rand(0..1)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def home_work_phone_number
      FFaker.numerify "#{COUNTRY_PREFIX.sample}#{AREA_PREFIX.sample}#{PHONE_NUMBER.sample}"
    end

    def mobile_phone_number
      FFaker.numerify "#{COUNTRY_PREFIX.sample}#{MOBILE_PREFIX.sample}#{PHONE_NUMBER.sample}"
    end
  end
end
