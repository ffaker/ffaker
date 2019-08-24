# frozen_string_literal: true

require 'ffaker/address'

module FFaker
  module AddressSN
    include FFaker::Address

    extend ModuleUtils
    extend self

    def region
      fetch_sample(REGIONS)
    end

    def departement
      fetch_sample(DEPARTEMENTS)
    end

    def arrondissement
      fetch_sample(ARRONDISSEMENTS)
    end
  end
end
