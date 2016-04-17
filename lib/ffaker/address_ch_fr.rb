# encoding: utf-8

require 'ffaker/address_ch'

module FFaker
  module AddressCHFR
    include AddressCH

    extend ModuleUtils
    extend self

    def canton
      CANTON.sample
    end
  end
end
