# encoding: utf-8

require 'ffaker/lorem'

module Faker
  module ElvenIpsum
    include Lorem

    extend ModuleUtils
    extend self

    def word
      ELVEN_WORDS.rand
    end

    def words(num = 3)
      ELVEN_WORDS.random_pick(num)
    end
  end
end
