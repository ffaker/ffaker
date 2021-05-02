# frozen_string_literal: true

module FFaker
  module AddressMX
    extend ModuleUtils
    extend self

    def zip_code
      FFaker.numerify('#####')
    end

    def postal_code
      FFaker.numerify('#####')
    end

    def state
      fetch_sample(STATE)
    end

    def state_abbr(st_name = nil)
      st_name ||= state
      STATE_ABBR[STATE.index(st_name)]
    end

    def municipality(st_abbr = nil)
      st_abbr ||= state_abbr
      municipalities = Object.const_get("FFaker::AddressMX::#{st_abbr.upcase}")
      fetch_sample(municipalities)
    end
  end
end
