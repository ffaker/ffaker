# frozen_string_literal: true

require 'ffaker/address_ch'

module FFaker
  module AddressCHIT
    include AddressCH

    extend ModuleUtils
    extend self

    def canton
      fetch_sample(CANTON)
    end
  end
end
