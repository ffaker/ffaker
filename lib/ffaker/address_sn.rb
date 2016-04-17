# encoding: utf-8

require 'ffaker/address'

module FFaker
  # Author PapePathe<pathe.sene@gmail.com> github.com/PapePathe
  module AddressSN
    include FFaker::Address

    extend ModuleUtils
    extend self

    def region
      REGIONS.sample
    end

    def departement
      DEPARTEMENTS.sample
    end

    def arrondissement
      ARRONDISSEMENTS.sample
    end
  end
end
