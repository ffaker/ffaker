# encoding: utf-8

module FFaker
  module GenderKR
    extend ModuleUtils
    extend self

    GENDERS = %w(남 녀).freeze

    def random
      GENDERS.sample
    end

    alias maybe random
    alias sample random
  end
end
