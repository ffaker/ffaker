# encoding: utf-8

require 'ffaker/address'

module FFaker
  # Author PapePathe<pathe.sene@gmail.com> github.com/PapePathe
  module AddressSN
    include FFaker::Address

    extend ModuleUtils
    extend self

    def region
      REGIONS.rand
    end

    def departement
      DEPARTEMENTS.rand
    end

    def arrondissement
      ARRONDISSEMENTS.rand
    end
  end
end
