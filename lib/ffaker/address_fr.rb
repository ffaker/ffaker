# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressFR
    include FFaker::Address

    extend ModuleUtils
    extend self

    NUM = ['#', '##', '##', '###', '####', '#-##'].freeze
    MOD = [' B', ' T', ' Q', ' BIS', ' TER', ' QUATER', '', '', '', ''].freeze
    SEP = [', ', ' '].freeze
    TYPE = %w(rue avenue av boulevard bd impasse).freeze
    POSTAL_CODE_FORMATS = ['####', '#####', '97####', '2A###', '2B###'].freeze

    def street_address
      FFaker.numerify(NUM.sample) +
        MOD.sample +
        SEP.sample +
        TYPE.sample + ' ' +
        FFaker::NameFR.name
    end

    def postal_code
      FFaker.numerify POSTAL_CODE_FORMATS.sample
    end

    def city
      CITY.sample
    end

    def full_address
      %(#{street_address}#{SEP.sample}#{postal_code} #{CITY.sample})
    end
  end
end
