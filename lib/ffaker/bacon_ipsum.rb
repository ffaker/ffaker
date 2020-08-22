# frozen_string_literal: true

module FFaker
  # Thanks to http://baconipsum.com/
  module BaconIpsum
    include Lorem

    extend ModuleUtils
    extend self

    def word
      fetch_sample(BACON_WORDS)
    end

    def words(num = 3)
      fetch_sample(BACON_WORDS, count: num)
    end
  end
end
