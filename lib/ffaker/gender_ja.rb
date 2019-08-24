# frozen_string_literal: true

module FFaker
  # https://ja.wikipedia.org/wiki/%E6%80%A7_(%E7%94%9F%E7%89%A9%E5%AD%A6)
  module GenderJA
    extend ModuleUtils
    extend self

    GENDERS = %w[女 男].freeze

    def random
      fetch_sample(GENDERS)
    end

    alias maybe random
    alias sample random
  end
end
