# frozen_string_literal: true

module FFaker
  module GenderRU
    extend ModuleUtils
    extend self

    GENDERS = %w[мужчина женщина нонбайнари агендер].freeze
    BINARY_GENDERS = %w[мужчина женщина].freeze

    def random
      fetch_sample(GENDERS)
    end

    def binary
      fetch_sample(BINARY_GENDERS)
    end

    alias maybe random
    alias sample random
  end
end
