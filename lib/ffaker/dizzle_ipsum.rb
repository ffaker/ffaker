# encoding: utf-8

module Faker
  # Thanks to Snoop Dogg
  module DizzleIpsum
    extend ModuleUtils
    extend Lorem
    extend self

    def word
      DIZZLE_WORDS.rand
    end

    def words(num = 3)
      DIZZLE_WORDS.random_pick(num)
    end
  end
end
