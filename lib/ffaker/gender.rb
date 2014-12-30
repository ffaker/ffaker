# encoding: utf-8

module Faker
  module Gender
    extend ModuleUtils
    extend self

    GENDERS = ['male', 'female']

    def random
      GENDERS[rand(GENDERS.size)]
    end

    alias_method :maybe, :random
    alias_method :sample, :random
  end
end
