# encoding: utf-8

module Faker
  module GenderCN
    extend ModuleUtils
    extend self

    def random
      ['男', '女'].sample
    end

    alias_method :maybe, :random
    alias_method :sample, :random
  end
end
