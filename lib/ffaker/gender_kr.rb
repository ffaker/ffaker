# encoding: utf-8

module Faker
  module GenderKR
    extend ModuleUtils
    extend self

    GENDERS = %w(남 녀)

    def random
      GENDERS.sample
    end

    alias_method :maybe, :random
    alias_method :sample, :random
  end
end
