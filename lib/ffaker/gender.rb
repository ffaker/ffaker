# encoding: utf-8

module FFaker
  module Gender
    extend ModuleUtils
    extend self

    GENDERS = %w[male female non-binary agender androgyne bi-gender pan-gender].freeze

    def random
      fetch_sample(GENDERS)
    end

    alias maybe random
    alias sample random
  end
end
