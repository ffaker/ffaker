# encoding: utf-8
# frozen_string_literal: true

module FFaker
  module AnimalUS
    extend ModuleUtils
    extend self

    def common_name
      fetch_sample(COMMON_NAMES)
    end
  end
end
