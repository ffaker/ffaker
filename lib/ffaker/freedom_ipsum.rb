# frozen_string_literal: true

require_relative 'lorem'

module FFaker
  module FreedomIpsum
    include Lorem

    extend ModuleUtils
    extend self

    def word
      fetch_sample(FREEDOM_WORDS)
    end

    def words(num = 3)
      fetch_sample(FREEDOM_WORDS, count: num)
    end
  end
end
