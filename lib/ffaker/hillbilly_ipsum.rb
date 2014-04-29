# encoding: utf-8

require 'ffaker/lorem'

module Faker
  # thanks to http://andymatthews.net/code/fillertext/hillbilly.cfm
  module HillbillyIpsum
    include Lorem

    extend ModuleUtils
    extend self

    def word
      HILLBILLY_WORDS.rand
    end

    def words(num = 3)
      HILLBILLY_WORDS.random_pick(num)
    end
  end
end
