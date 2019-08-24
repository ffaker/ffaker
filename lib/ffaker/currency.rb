# frozen_string_literal: true

module FFaker
  module Currency
    extend ModuleUtils
    extend self

    def code
      fetch_sample(CURRENCY_CODE)
    end

    def name
      fetch_sample(CURRENCY_NAME)
    end

    def symbol
      fetch_sample(CURRENCY_SYMBOL)
    end
  end
end
