# frozen_string_literal: true

module FFaker
  module Product
    extend ModuleUtils
    extend self

    B2 = %w[nix cell sync func balt sche pod].freeze
    VOWELS = %w[a e i o u ou ie y io].freeze
    START  = %w[tr br p ph].freeze
    SUFFIX = %w[ck ns nce nt st ne re ffe ph].freeze
    ADDON  = %w[wood forge func].freeze

    def brand
      case rand(0..11)
      when (0..4) then fetch_sample(B1) + fetch_sample(B2)
      when (5..10)
        [
          fetch_sample(START), fetch_sample(VOWELS), fetch_sample(SUFFIX),
          rand(0..1).zero? ? fetch_sample(ADDON) : nil
        ].join.capitalize
      when 11 then letters(2..3).to_s
      end
    end

    def product_name
      return "#{fetch_sample(ADJ)} #{fetch_sample(NOUN)}" if rand(0..1).zero?

      "#{[fetch_sample(ADJ), fetch_sample(ADJ)].uniq.join(' ')} #{fetch_sample(NOUN)}"
    end

    def product
      "#{brand} #{product_name}"
    end

    def letters(count)
      max = count.is_a?(Range) ? fetch_sample(count.to_a) : count
      (0...max).map { fetch_sample(LETTERS).upcase }.join
    end

    def model
      return "#{fetch_sample(LETTERS).upcase}#{rand(90)}" if rand(0..1).zero? # N90

      "#{letters(1..rand(1..2))}-#{rand(9900)}" # N-9400
    end
  end
end
