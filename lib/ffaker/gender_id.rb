# frozen_string_literal: true

module FFaker
  module GenderID
    extend ModuleUtils
    extend self

    GENDERS = %w[laki-laki perempuan].freeze

    def random
      fetch_sample(GENDERS)
    end

    alias maybe random
    alias sample random
  end
end
