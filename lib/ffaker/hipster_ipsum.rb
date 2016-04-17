# encoding: utf-8

require 'ffaker/lorem'

module FFaker
  # thanks to http://hipsteripsum.me
  module HipsterIpsum
    include Lorem

    extend ModuleUtils
    extend self

    def word
      HIPSTER_WORDS.sample
    end

    def words(num = 3)
      HIPSTER_WORDS.sample(num)
    end
  end
end
