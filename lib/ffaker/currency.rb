# encoding: utf-8

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
  end
end
