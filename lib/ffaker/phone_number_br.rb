# encoding: utf-8
# frozen_string_literal: true

module FFaker
  # Author: Gustavo Souza https://github.com/gustavor-souza
  # Sources:
  # - https://en.wikipedia.org/wiki/Telephone_numbers_in_Brazil
  # - http://www.teleco.com.br/num_cel.asp
  # - http://ddd.online24hs.com.br/
  # - https://tecnoblog.net/24850/prefixo-10-para-grande-sao-paulo-deve-comecar-a-funcionar-em-outubro/
  #
  module PhoneNumberBR
    extend ModuleUtils
    extend self

    COUNTRY_PREFIX         = '+55'.freeze
    AREA_CODE              = [
      10..19, 21..22, 24, 27..28, 31..35, 37..38, 41..49,
      51..54, 55, 61..69, 71..75, 77, 79, 81..89, 91..99
    ].flat_map { |x| Array(x) }.map(&:to_s).freeze

    HOME_WORK_PHONE_PREFIX = %w[2 3 4 5].freeze
    MOBILE_PHONE_PREFIX    = %w[6 7 8 9 96 97 98 99].freeze
    PHONE_NUMBER           = %w[####### ###-####].freeze

    # generate a random phone number
    #
    def phone_number
      case rand(0..1)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def home_work_phone_number
      number HOME_WORK_PHONE_PREFIX
    end

    def mobile_phone_number
      number MOBILE_PHONE_PREFIX
    end

    # pick a random phone number with the international prefix code
    #
    def international_phone_number
      case rand(0..1)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end

    def international_mobile_phone_number
      number MOBILE_PHONE_PREFIX, COUNTRY_PREFIX
    end

    def international_home_work_phone_number
      number HOME_WORK_PHONE_PREFIX, COUNTRY_PREFIX
    end

    def country_code
      COUNTRY_PREFIX
    end

    private

    def number(prefixes, country_prefix = '')
      space = random_space
      p = [
        country_prefix,
        space,
        fetch_sample(AREA_CODE),
        space,
        fetch_sample(prefixes),
        fetch_sample(PHONE_NUMBER)
      ].join('').strip

      FFaker.numerify p
    end

    def random_space
      rand(0..1) == 1 ? ' ' : ''
    end
  end
end
