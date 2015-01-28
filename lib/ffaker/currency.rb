# encoding: utf-8

module Faker
  module Currency
    extend ModuleUtils
    extend self

    def code
      CURRENCY_CODE.rand
    end

    def name
      CURRENCY_NAME.rand
    end
  end
end
