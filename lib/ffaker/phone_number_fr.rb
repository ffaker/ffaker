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
    PHONE_NUMBER           = ['########', ' ## ## ## ##'].freeze

    def home_work_phone_number
      number HOME_WORK_PHONE_PREFIX
    end

    def mobile_phone_number
      number MOBILE_PHONE_PREFIX
    end

    # generates mobile or home/work number
    def phone_number
      rand(0..1).zero? ? home_work_phone_number : mobile_phone_number
    end

    def country_code
      "#{fetch_sample(['+', '00'])}#{COUNTRY_CODE}"
    end

    def international_mobile_phone_number
      number MOBILE_PHONE_PREFIX, country_code
    end

    def international_home_work_phone_number
      number HOME_WORK_PHONE_PREFIX, country_code
    end

    def international_phone_number
      rand(0..1).zero? ? international_mobile_phone_number : international_home_work_phone_number
    end

    private

    def number(prefixes, country_prefix = '')
      space  = random_space
      prefix = fetch_sample(prefixes)
      prefix = prefix[1] unless country_prefix == ''

      FFaker.numerify [
        country_prefix,
        space,
        prefix,
        fetch_sample(PHONE_NUMBER)
      ].join.strip
    end

    def random_space
      rand(0..1).zero? ? '' : ' '
    end
  end
end
