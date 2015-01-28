# encoding: utf-8

require 'ffaker/address'

module Faker
  module AddressUS
    include Faker::Address

    extend ModuleUtils
    extend self

    ZIP_FORMATS = ['#####', '#####-####']
    CONTINENTAL_STATE = (STATE - ['Hawaii', 'Alaska'])
    CONTINENTAL_STATE_ABBR = (STATE_ABBR - ['HI', 'AK'])

    def zip_code
      Faker.numerify ZIP_FORMATS.sample
    end

    def state
      STATE.sample
    end

    def state_abbr
      STATE_ABBR.sample
    end

    def state_and_territories_abbr
      STATE_AND_TERRITORIES_ABBR.sample
    end

    def continental_state
      CONTINENTAL_STATE.sample
    end

    def continental_state_abbr
      CONTINENTAL_STATE_ABBR.sample
    end
  end
end
