# encoding: utf-8

module Faker
  module Gender
    extend ModuleUtils
    extend self

    GENDERS = %w(male female)

    def random
      GENDERS.sample
    end

    alias_method :maybe, :random
    alias_method :sample, :random
  end
end
