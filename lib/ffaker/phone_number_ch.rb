# encoding: utf-8

module FFaker
  module PhoneNumberCH
    extend ModuleUtils
    extend self

    COUNTRY_PREFIX = %w[+41 0041 0].freeze
    AREA_PREFIX = %w[21 22 24 26 27 31 32 33 34 41 43 44 51 52 56 58 61 62 71 81 91].freeze
    MOBILE_PREFIX = %w[74 75 76 77 78 79].freeze
    FREE_PHONE_PREFIX = %w[800].freeze
    SHARED_COST_PREFIX = %w[840 842 844 848].freeze
    PREMIUM_RATE_PREFIX = %w[900 901 906].freeze
    PHONE_NUMBER = ['#######', ' ### ## ##'].freeze

    def phone_number
      case rand(0..4)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      when 2 then free_phone_number
      when 3 then shared_cost_phone_number
      when 4 then premium_rate_phone_number
      end
    end

    def home_work_phone_number
      FFaker.numerify "#{COUNTRY_PREFIX.sample}#{AREA_PREFIX.sample}#{PHONE_NUMBER.sample}"
    end

    def mobile_phone_number
      FFaker.numerify "#{COUNTRY_PREFIX.sample}#{MOBILE_PREFIX.sample}#{PHONE_NUMBER.sample}"
    end

    def free_phone_number
      FFaker.numerify "#{COUNTRY_PREFIX.sample}#{FREE_PHONE_PREFIX.sample}#{PHONE_NUMBER.sample}"
    end

    def shared_cost_phone_number
      FFaker.numerify "#{COUNTRY_PREFIX.sample}#{SHARED_COST_PREFIX.sample}#{PHONE_NUMBER.sample}"
    end

    def premium_rate_phone_number
      FFaker.numerify "#{COUNTRY_PREFIX.sample}#{PREMIUM_RATE_PREFIX.sample}#{PHONE_NUMBER.sample}"
    end
  end
end
