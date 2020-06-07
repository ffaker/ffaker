# frozen_string_literal: true

module FFaker
  module Code
    extend ModuleUtils
    extend self

    def npi(legacy: false)
      max = legacy ? 299_999_999 : 999_999_999
      base_npi = rand(100_000_000..max).to_s

      summed_digits = base_npi
                      .chars
                      .each_with_index
                      .map { |n, i| (i.even? ? n.to_i * 2 : n).to_s }
                      .join
                      .chars
                      .inject(0) { |sum, digit| sum + digit.to_i }

      npi_checksum = (10 - (24 + summed_digits) % 10).to_s.chars.last

      base_npi + npi_checksum
    end

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
