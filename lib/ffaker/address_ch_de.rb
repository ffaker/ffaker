# frozen_string_literal: true

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
