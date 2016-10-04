# encoding: utf-8

module FFaker
  module ColorUA
    extend ModuleUtils
    extend self

    def name
      fetch_sample(NAMES_LIST)
    end
  end
end
