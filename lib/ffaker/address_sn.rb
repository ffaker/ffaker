# frozen_string_literal: true

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
