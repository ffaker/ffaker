# encoding: utf-8

require 'ffaker/address'

module Faker
  # Author PapePathe<pathe.sene@gmail.com> github.com/PapePathe
  module AddressSN
    include Faker::Address

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
