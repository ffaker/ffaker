# frozen_string_literal: true

module FFaker
  # Sources:
  # - https://en.wikipedia.org/wiki/Telephone_numbers_in_Brazil
  # - http://www.teleco.com.br/num_cel.asp
  # - http://ddd.online24hs.com.br/
  # - https://tecnoblog.net/24850/prefixo-10-para-grande-sao-paulo-deve-comecar-a-funcionar-em-outubro/
  # - http://agenciabrasil.ebc.com.br/geral/noticia/2016-10/numeros-de-celulares-de-todo-o-pais-terao-nove-digitos-partir-do-dia-6
  #
  module PhoneNumberBR
    extend ModuleUtils
    extend self

    COUNTRY_PREFIX = '+55'
    AREA_CODE = [
      11..19, 21..22, 24, 27..28, 31..35, 37..38, 41..49,
      51, 53..55, 61..69, 71, 73..75, 77, 79, 81..89, 91..99
    ].flat_map { |x| Array(x) }.map(&:to_s).freeze

    HOME_WORK_PHONE_PREFIX = %w[2 3 4 5].freeze
    MOBILE_PHONE_PREFIX    = %w[96 97 98 99].freeze
    PHONE_NUMBER           = %w[####### ###-####].freeze

    # generate a random phone number
    #
    def phone_number
      rand(0..1).zero? ? home_work_phone_number : mobile_phone_number
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
      rand(0..1).zero? ? international_mobile_phone_number : international_home_work_phone_number
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
