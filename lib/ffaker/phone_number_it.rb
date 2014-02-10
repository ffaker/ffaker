# encoding: utf-8

module Faker
  module PhoneNumberIT
    extend ModuleUtils
    extend self

    def phone_number
      if rand(0..1) == 1
        home_phone_number
      else
        mobile_phone_number
      end
    end

    def home_phone_number
      number HOME_PHONE_PREFIXES
    end

    def mobile_phone_number
      number MOBILE_PHONE_PREFIXES
    end

    def number(prefixes)
      p = [
        COUNTRY_PREFIX.rand,
        prefixes.rand,
        random_space,
        PHONE_NUMBER.rand
      ].join('')

      Faker.numerify p
    end

    def random_space
      rand(0..1) == 1 ? ' ' : ''
    end

    COUNTRY_PREFIX = k ['+39', '0039', '+39 ', '0039 ']
    PHONE_NUMBER = k ['######', '########']
  end
end
