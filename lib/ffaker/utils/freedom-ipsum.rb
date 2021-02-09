# encoding: utf-8

require 'ffaker/lorem'

module FFaker
  module FreedomIpsum
    include Lorem

    extend ModuleUtils
    extend self

    def word
      FREEDOM_WORDS.sample
    end

    def words(num = 3)
      FREEDOM_WORDS.sample(num)
    end
  end
end
