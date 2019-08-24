# frozen_string_literal: true

module FFaker
  module GenderKR
    extend ModuleUtils
    extend self

    GENDERS = %w[남 녀].freeze

    def random
      fetch_sample(GENDERS)
    end

    alias maybe random
    alias sample random
  end
end
