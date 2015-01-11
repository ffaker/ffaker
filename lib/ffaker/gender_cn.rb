# encoding: utf-8

module Faker
  module GenderCN
    extend ModuleUtils
    extend self

    GENDERS = ['男', '女']

    def random
      GENDERS.sample
    end

    alias_method :maybe, :random
    alias_method :sample, :random
  end
end
