# encoding: utf-8

module FFaker
  module PhoneNumberIT
    extend ModuleUtils
    extend self

    COUNTRY_PREFIX = ['+39', '0039', '+39 ', '0039 '].freeze
    PHONE_NUMBER = ['######', '########'].freeze

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
        COUNTRY_PREFIX.sample,
        prefixes.sample,
        random_space,
        PHONE_NUMBER.sample
      ].join('')

      FFaker.numerify p
    end

    def random_space
      rand(0..1) == 1 ? ' ' : ''
    end
  end
end
