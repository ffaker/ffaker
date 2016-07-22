# encoding: utf-8

require 'ffaker/lorem'

module FFaker
  # thanks to http://hipsteripsum.me
  module HipsterIpsum
    include Lorem

    extend ModuleUtils
    extend self

    def word
      fetch_sample(HIPSTER_WORDS)
    end

    def words(num = 3)
      fetch_sample(HIPSTER_WORDS, count: num)
    end
  end
end
