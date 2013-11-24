# encoding: utf-8

module Faker
  # thanks to http://hipsteripsum.me
  module HipsterIpsum
    extend ModuleUtils
    extend Lorem
    extend self

    def word
      HIPSTER_WORDS.rand
    end

    def words(num = 3)
      HIPSTER_WORDS.random_pick(num)
    end
  end
end
