# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressIN
    include FFaker::Address

    extend ModuleUtils
    extend self

    ZIP_FORMATS = ['######']

    def pincode
      FFaker.numerify ZIP_FORMATS.sample
    end

    alias_method :zip_code, :pincode

    def state
      STATE.sample
    end

    def state_abbr
      STATE_ABBR.sample
    end

    def union_territory
      UNION_TERRITORY.sample
    end

    def union_territory_abbr
      UNION_TERRITORY_ABBR.sample
    end

    def state_and_union_territory
      (STATE + UNION_TERRITORY).sample
    end

    def state_and_union_territory_abbr
      (STATE_ABBR + UNION_TERRITORY_ABBR).sample
    end

    def country
      FFaker::Address.country("IN")
    end

    def country_code
      FFaker::Address.country_code("India")
    end

    def time_zone
      "Asia/Kolkata"
    end
  end
end
