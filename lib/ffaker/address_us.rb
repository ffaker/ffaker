# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressUS
    include FFaker::Address

    extend ModuleUtils
    extend self

    ZIP_FORMATS = ['#####', '#####-####'].freeze
    CONTINENTAL_STATE = (STATE - %w[Hawaii Alaska])
    CONTINENTAL_STATE_ABBR = (STATE_ABBR - %w[HI AK])

    def zip_code
      FFaker.numerify(fetch_sample(ZIP_FORMATS))
    end

    def state
      fetch_sample(STATE)
    end

    def state_abbr
      fetch_sample(STATE_ABBR)
    end

    def state_and_territories_abbr
      fetch_sample(STATE_AND_TERRITORIES_ABBR)
    end

    def continental_state
      fetch_sample(CONTINENTAL_STATE)
    end

    def continental_state_abbr
      fetch_sample(CONTINENTAL_STATE_ABBR)
    end
  end
end
