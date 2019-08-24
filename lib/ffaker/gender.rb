# frozen_string_literal: true

module FFaker
  module Gender
    extend ModuleUtils
    extend self

    GENDERS = %w[male female non-binary agender androgyne bi-gender pan-gender].freeze
    BINARY_GENDERS = %w[male female].freeze

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
