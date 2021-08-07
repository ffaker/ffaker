# frozen_string_literal: true

module FFaker
  # Inspirations:
  # https://pl.wikipedia.org/wiki/P%C5%82e%C4%87
  module GenderPL
    extend ModuleUtils
    extend self

    GENDERS = %w[kobieta mężczyzna].freeze

    def random
      fetch_sample(GENDERS)
    end

    alias maybe random
    alias sample random
  end
end
