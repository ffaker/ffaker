# encoding: utf-8

module FFaker
  # Author: Gustavo Souza https://github.com/gustavor-souza
  # Source https://en.wikipedia.org/wiki/Telephone_numbers_in_Brazil
  #
  module PhoneNumberBR
    extend ModuleUtils
    extend self

    COUNTRY_PREFIX        = %w['+55' '0055' '0']
    AREA_CODE             = %w['1#' '2#' '3#' '4#' '5#' '6#' '7#' '8#' '9#']
    CARRIER_CODE          = %w['12' '14' '15' '21' '25' '31' '41' '43']
    HOME_PHONE_PREFIX     = %w['2' '3' '4' '5']
    MOBILE_PHONE_PREFIX   = %w['6' '7' '8' '9' '96' '97' '98' '99']
    PHONE_NUMBER          = %w['#######' '###-####']

    def phone_number
      case rand(4)
      when 0 then home_phone_number
      when 1 then mobile_phone_number
      else
        international_phone_number
      end
    end

    def home_phone_number
      number HOME_PHONE_PREFIX
    end

    def mobile_phone_number
      number MOBILE_PHONE_PREFIX
    end

    def international_phone_number
      case rand(2)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end

    def international_mobile_phone_number
      number MOBILE_PHONE_PREFIX, COUNTRY_PREFIX
    end

    def international_home_work_phone_number
      number HOME_PHONE_PREFIX, COUNTRY_PREFIX
    end

    def number(prefixes, country_prefix = [''])
      space = random_space
      p = [
        country_prefix.sample,
        space,
        CARRIER_CODE.sample,
        space,
        AREA_CODE.sample,
        space,
        prefixes.sample,
        PHONE_NUMBER.sample
      ].join('').squish

      FFaker.numerify p
    end

    def random_space
      rand(2) == 1 ? ' ' : ''
    end
  end
end
