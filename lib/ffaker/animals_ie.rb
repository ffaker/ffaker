# encoding: utf-8

module FFaker
  module AnimalIE
    extend ModuleUtils
    extend self

    def common_name
      fetch_sample(COMMON_NAMES)
    end
  end
end
