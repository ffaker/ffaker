# encoding: utf-8

module FFaker
  module Animal
    extend ModuleUtils
    extend self

    def common_name
      fetch_sample(COMMON_NAMES)
    end
  end
end
