# encoding: utf-8
# frozen_string_literal: true

module FFaker
  module Code
    extend ModuleUtils
    extend self

    def ean
      ean = rand(100_000_000_000..999_999_999_999).to_s

      sum = 0
      ean.chars.each_with_index { |c, i| sum += c.to_i * (i.odd? ? 3 : 1) }

      nearest_multiple_of_ten = sum.round(-1)
      nearest_multiple_of_ten += 10 if nearest_multiple_of_ten < sum

      "#{ean}#{nearest_multiple_of_ten - sum}"
    end
  end
end
