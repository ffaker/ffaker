# encoding: utf-8

require 'ffaker/lorem'

module FFaker
  # Thanks to http://baconipsum.com/
  module BaconIpsum
    include Lorem

    extend ModuleUtils
    extend self

    def word
      BACON_WORDS.sample
    end

    def words(num = 3)
      BACON_WORDS.sample(num)
    end
  end
end
