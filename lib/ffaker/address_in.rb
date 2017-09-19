# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressIN
    include FFaker::Address

    extend ModuleUtils
    extend self

    def zip_code
      FFaker.numerify('######')
    end

    alias pincode zip_code

    def state
      fetch_sample(STATE)
    end

    def state_abbr
      fetch_sample(STATE_ABBR)
    end

    def union_territory
      fetch_sample(UNION_TERRITORY)
    end

    def union_territory_abbr
      fetch_sample(UNION_TERRITORY_ABBR)
    end

    def state_and_union_territory
      fetch_sample(STATE + UNION_TERRITORY)
    end

    def state_and_union_territory_abbr
      fetch_sample(STATE_ABBR + UNION_TERRITORY_ABBR)
    end

    def country
      FFaker::Address.country('IN')
    end

    def country_code
      FFaker::Address.country_code('India')
    end

    def time_zone
      'Asia/Kolkata'
    end
  end
end
