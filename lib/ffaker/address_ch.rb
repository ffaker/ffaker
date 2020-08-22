# frozen_string_literal: true

module FFaker
  module AddressCH
    include FFaker::Address

    extend ModuleUtils
    extend self

    def postal_code
      FFaker.numerify '####'
    end

    def canton_abbr
      fetch_sample(CANTON_ABBR)
    end
  end
end
