# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressUS
    include FFaker::Address

    extend ModuleUtils
    extend self

    ZIP_FORMATS = ['#####', '#####-####'].freeze
    CONTINENTAL_STATE = (STATE - %w(Hawaii Alaska))
    CONTINENTAL_STATE_ABBR = (STATE_ABBR - %w(HI AK))

    def zip_code
      FFaker.numerify ZIP_FORMATS.sample
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
