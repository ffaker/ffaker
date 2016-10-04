# encoding: utf-8

require 'ffaker/address_ch'

module FFaker
  module AddressCHDE
    include AddressCH

    extend ModuleUtils
    extend self

    def canton
      fetch_sample(CANTON)
    end
  end
end
