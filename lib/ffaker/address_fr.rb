# encoding: utf-8

require 'ffaker/address'

module Faker
  module AddressFR
    include Faker::Address

    extend ModuleUtils
    extend self

    NUM = ['#', '##', '##', '###', '####', '#-##']
    MOD = [' B', ' T', ' Q', ' BIS', ' TER', ' QUATER', '', '', '', '']
    SEP = [', ', ' ']
    TYPE = %w[rue avenue av boulevard bd impasse]
    POSTAL_CODE_FORMATS = ['####', '#####', '97####', '2A###', '2B###']

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
  end
end
