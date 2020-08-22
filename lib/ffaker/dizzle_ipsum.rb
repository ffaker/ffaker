# frozen_string_literal: true

module FFaker
  # Thanks to Snoop Dogg
  module DizzleIpsum
    extend Lorem

    extend ModuleUtils
    extend self

    def word
      fetch_sample(DIZZLE_WORDS)
    end

    def words(num = 3)
      fetch_sample(DIZZLE_WORDS, count: num)
    end
  end
end
