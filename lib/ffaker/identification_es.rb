# frozen_string_literal: true

module FFaker
  module IdentificationES
    extend ModuleUtils
    extend self

    GENDERS = %w[Hombre Mujer].freeze

    def gender
      fetch_sample(GENDERS)
    end
  end
end
