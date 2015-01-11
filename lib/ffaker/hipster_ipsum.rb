# encoding: utf-8

require 'ffaker/lorem'

module Faker
  # thanks to http://hipsteripsum.me
  module HipsterIpsum
    include Lorem

    extend ModuleUtils
    extend self

    def word
      HIPSTER_WORDS.sample
    end

    def words(num = 3)
      HIPSTER_WORDS.random_pick(num)
    end
  end
end
