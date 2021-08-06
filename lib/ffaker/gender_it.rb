# frozen_string_literal: true

module FFaker
  module GenderIT
    extend ModuleUtils
    extend self

    GENDERS = %w[maschio femmina].freeze

    def random
      fetch_sample(GENDERS)
    end

    alias maybe random
    alias sample random
  end
end
