# frozen_string_literal: true

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

    private

    def number(prefixes)
      pattern = [
        fetch_sample(COUNTRY_PREFIX),
        fetch_sample(prefixes),
        random_space,
        fetch_sample(PHONE_NUMBER)
      ].join

      FFaker.numerify(pattern)
    end

    def random_space
      rand(0..1) == 1 ? ' ' : ''
    end
  end
end
