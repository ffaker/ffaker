# encoding: utf-8

require 'ffaker/address'

module Faker
  module AddressFR
    include Faker::Address

    extend ModuleUtils
    extend self

    def street_address
      Faker.numerify(NUM.sample) +
      MOD.sample +
      SEP.sample +
      TYPE.sample + ' ' +
      Faker::NameFR.name
    end

    def postal_code
      Faker.numerify POSTAL_CODE_FORMATS.sample
    end

    def city
      CITY.sample
    end

    def full_address
      %Q{#{street_address}#{SEP.sample}#{postal_code} #{CITY.sample}}
    end

    NUM = k ['#', '##', '##', '###', '####', '#-##']
    MOD = k [' B', ' T', ' Q', ' BIS', ' TER', ' QUATER', '', '', '', '']
    SEP = k [', ', ' ']
    TYPE = k %w[rue avenue av boulevard bd impasse]
    POSTAL_CODE_FORMATS = k ['####', '#####', '97####', '2A###', '2B###']
  end
end
