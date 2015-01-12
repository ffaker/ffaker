# encoding: utf-8

module Faker
  module PhoneNumberFR
    extend ModuleUtils
    extend self

    COUNTRY_PREFIX = %w[+33 0033 0]
    AREA_PREFIX = %w[1 2 3 4 5]
    MOBILE_PREFIX = %w[6 7]
    PHONE_NUMBER = ['########', ' ## ## ## ##']

    def phone_number
      case rand(2)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def home_work_phone_number
      Faker.numerify "#{COUNTRY_PREFIX.sample}#{AREA_PREFIX.sample}#{PHONE_NUMBER.sample}"
    end

    def mobile_phone_number
      Faker.numerify "#{COUNTRY_PREFIX.sample}#{MOBILE_PREFIX.sample}#{PHONE_NUMBER.sample}"
    end
  end
end
