# encoding: utf-8

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
