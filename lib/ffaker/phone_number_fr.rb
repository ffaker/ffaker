# frozen_string_literal: true

module FFaker
  # Source: https://en.wikipedia.org/wiki/Telephone_numbers_in_France
  module PhoneNumberFR
    extend ModuleUtils
    extend self

    COUNTRY_CODE           = '33'
    AREA_PREFIX            = %w[01 02 03 04 05].freeze
    NON_AREA_PREFIX        = %w[09].freeze
    HOME_WORK_PHONE_PREFIX = AREA_PREFIX + NON_AREA_PREFIX
    MOBILE_PHONE_PREFIX    = %w[06 07].freeze
    PHONE_PREFIX           = HOME_WORK_PHONE_PREFIX + MOBILE_PHONE_PREFIX
    PHONE_NUMBER = ['########', ' ## ## ## ##'].freeze
    PHONE_NUMBER_NO_SPACES = '########'

    def home_work_phone_number(spaces: true)
      number(HOME_WORK_PHONE_PREFIX, spaces:)
    end

    def mobile_phone_number(spaces: true)
      number(MOBILE_PHONE_PREFIX, spaces:)
    end

    # generates mobile or home/work number
    def phone_number(spaces: true)
      rand(0..1).zero? ? home_work_phone_number(spaces:) : mobile_phone_number(spaces:)
    end

    def country_code
      "#{fetch_sample(['+', '00'])}#{COUNTRY_CODE}"
    end

    def international_mobile_phone_number(spaces: true)
      number(MOBILE_PHONE_PREFIX, country_code, spaces:)
    end

    def international_home_work_phone_number(spaces: true)
      number(HOME_WORK_PHONE_PREFIX, country_code, spaces:)
    end

    def international_phone_number(spaces: true)
      rand(0..1).zero? ? international_mobile_phone_number(spaces:) : international_home_work_phone_number(spaces:)
    end

    private

    def number(prefixes, country_prefix = '', spaces: true)
      prefix      = fetch_sample(prefixes)
      prefix      = prefix[1] unless country_prefix.empty?
      space       = spaces ? random_space : ''
      number_part = spaces ? fetch_sample(PHONE_NUMBER) : PHONE_NUMBER_NO_SPACES

      FFaker.numerify "#{country_prefix}#{space}#{prefix}#{number_part}".strip
    end

    def random_space
      rand(0..1).zero? ? '' : ' '
    end
  end
end
