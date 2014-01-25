# encoding: utf-8

require 'ffaker/address'

module Faker
  module AddressFR
    include Faker::Address

    extend ModuleUtils
    extend self

    def street_address
      Faker.numerify(NUM.rand) +
      MOD.rand +
      SEP.rand +
      TYPE.rand + ' ' +
      Faker::NameFR.name
    end

    def postal_code
      Faker.numerify POSTAL_CODE_FORMATS.rand
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
