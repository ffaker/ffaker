# frozen_string_literal: true

# sourse: https://www.soumu.go.jp/main_sosiki/joho_tsusin/top/tel_number/number_shitei.html#kotei-denwa

module FFaker
  module PhoneNumberJA
    extend ModuleUtils
    extend self

    JAPAN_PREFIX = '0'
    JAPAN_COUNTRY_CODE = '+81'

    ONE_DISIT_FORMAT = '%s #### ####'
    TWO_DISIT_FORMAT = '%s ### ####'
    THREE_DISIT_FORMAT = '%s ## ####'
    FOUR_DISIT_FORMAT = '%s # ####'

    MOBILE_PHONE_PREFIXES = %w[90 80 70].freeze
    IP_PHONE_PREFIX = '50'
    MOBILE_NUMBER_FORMAT = '%s #### ####'

    def home_phone_number
      disit = rand(1..4)
      FFaker.numerify("#{JAPAN_PREFIX}#{home_phone_number_format(disit)}")
    end

    def mobile_phone_number
      FFaker.numerify("#{JAPAN_PREFIX}#{mobile_phone_number_format}")
    end

    def phone_number
      case rand(0..1)
      when 0 then home_phone_number
      when 1 then mobile_phone_number
      end
    end

    def international_home_phone_number
      disit = rand(1..4)
      FFaker.numerify("#{JAPAN_COUNTRY_CODE} #{home_phone_number_format(disit)}")
    end

    def international_mobile_phone_number
      FFaker.numerify("#{JAPAN_COUNTRY_CODE} #{mobile_phone_number_format}")
    end

    def international_phone_number
      case rand(0..1)
      when 0 then international_mobile_phone_number
      when 1 then international_home_phone_number
      end
    end

    def home_phone_prefix(disit = nil)
      case disit
      when 1 then fetch_sample(ONE_DISIT_AREA_CODES)
      when 2 then fetch_sample(TWO_DISIT_AREA_CODES)
      when 3 then fetch_sample(THREE_DISIT_AREA_CODES)
      when 4 then fetch_sample(FOUR_DISIT_AREA_CODES)
      end
    end

    def home_phone_number_format(disit)
      prefix = home_phone_prefix(disit)
      select_home_phone_format(disit) % prefix
    end

    def mobile_prefix
      fetch_sample(MOBILE_PHONE_PREFIXES)
    end

    def mobile_phone_number_format
      prefix = mobile_prefix
      MOBILE_NUMBER_FORMAT % prefix
    end

    private

    def select_home_phone_format(disit)
      case disit
      when 1 then ONE_DISIT_FORMAT
      when 2 then TWO_DISIT_FORMAT
      when 3 then THREE_DISIT_FORMAT
      when 4 then FOUR_DISIT_FORMAT
      end
    end
  end
end
