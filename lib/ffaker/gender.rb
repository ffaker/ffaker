# encoding: utf-8

module Faker
  module Gender
    extend ModuleUtils
    extend self

    def random
      ['male', 'female'].sample
    end

  end
end
