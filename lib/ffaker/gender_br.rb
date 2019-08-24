# frozen_string_literal: true

module FFaker
  module GenderBR
    extend ModuleUtils
    extend self

    GENDERS = %w[feminino masculino].freeze

    def random
      fetch_sample(GENDERS)
    end

    alias maybe random
    alias sample random
  end
end
