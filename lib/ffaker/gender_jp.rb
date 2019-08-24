# frozen_string_literal: true

module FFaker
  # Inspirations:
  # https://ja.wikipedia.org/wiki/%E6%80%A7_(%E7%94%9F%E7%89%A9%E5%AD%A6)
  module GenderJP
    extend ModuleUtils
    extend GenderJA
    include GenderJA
  end
end
