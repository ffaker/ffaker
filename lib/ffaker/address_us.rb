# encoding: utf-8

require 'ffaker/address'

module Faker
  module AddressUS
    include Faker::Address

    extend ModuleUtils
    extend self

    def zip_code
      Faker.numerify ZIP_FORMATS.rand
    end

    def state
      STATE.rand
    end

    def state_abbr
      STATE_ABBR.rand
    end

    def state_and_territories_abbr
      STATE_AND_TERRITORIES_ABBR.rand
    end

    ZIP_FORMATS = k ['#####', '#####-####']
  end
end
