# encoding: utf-8

module FFaker
  module ColorUA
    extend ModuleUtils
    extend self

    def name
      NAMES_LIST.sample
    end
  end
end
