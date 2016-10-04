# encoding: utf-8

require 'ffaker/address'

module FFaker
  # Author PapePathe<pathe.sene@gmail.com> github.com/PapePathe
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
