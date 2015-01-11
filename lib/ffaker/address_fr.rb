# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressFR
    include FFaker::Address

    extend ModuleUtils
    extend self

    def street_address
      FFaker.numerify(NUM.rand) +
      MOD.rand +
      SEP.rand +
      TYPE.rand + ' ' +
      FFaker::NameFR.name
    end

    def postal_code
      FFaker.numerify POSTAL_CODE_FORMATS.rand
    end

    def city
      CITY.rand
    end

    def full_address
      %Q{#{street_address}#{SEP.rand}#{postal_code} #{CITY.rand}}
    end

    NUM = k ['#', '##', '##', '###', '####', '#-##']
    MOD = k [' B', ' T', ' Q', ' BIS', ' TER', ' QUATER', '', '', '', '']
    SEP = k [', ', ' ']
    TYPE = k %w[rue avenue av boulevard bd impasse]
    POSTAL_CODE_FORMATS = k ['####', '#####', '97####', '2A###', '2B###']
  end
end
