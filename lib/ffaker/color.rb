# encoding: utf-8

module Faker
  module Color
    extend ModuleUtils
    extend self

    def name
      NAMES_LIST.rand
    end

  end
end
