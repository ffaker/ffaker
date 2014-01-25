# encoding: utf-8

module Faker
  module PhoneNumberFR
    extend ModuleUtils
    extend self

    def phone_number
      case rand(2)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def home_work_phone_number
      Faker.numerify "#{COUNTRY_PREFIX.rand}#{AREA_PREFIX.rand}#{PHONE_NUMBER.rand}" 
    end

    def mobile_phone_number
      Faker.numerify "#{COUNTRY_PREFIX.rand}#{MOBILE_PREFIX.rand}#{PHONE_NUMBER.rand}" 
    end

    COUNTRY_PREFIX = k %w[+33 0033 0]
    AREA_PREFIX = k %w[1 2 3 4 5]
    MOBILE_PREFIX = k %w[6 7]
    PHONE_NUMBER = k ['########', ' ## ## ## ##']
  end
end
