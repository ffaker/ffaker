# encoding: utf-8

module FFaker
  module GenderCN
    extend ModuleUtils
    extend self

    GENDERS = %w[男 女].freeze

    def random
      fetch_sample(GENDERS)
    end

    alias maybe random
    alias sample random
  end
end
