# encoding: utf-8

module Faker
  module GenderCN
    extend ModuleUtils
    extend self

    def random
      ['男', '女'].sample
    end

  end
end
