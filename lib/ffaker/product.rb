# encoding: utf-8

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
      when (5..10) then
        [
          fetch_sample(START), fetch_sample(VOWELS), fetch_sample(SUFFIX),
          rand(0..1).zero? ? fetch_sample(ADDON) : nil
        ].join.capitalize
      when 11 then letters(2..3).to_s
      end
    end

    def product_name
      case rand(0..1)
      when 0 then "#{fetch_sample(ADJ)} #{fetch_sample(NOUN)}"
      when 1 then "#{[fetch_sample(ADJ), fetch_sample(ADJ)].uniq.join(' ')} #{fetch_sample(NOUN)}"
      end
    end

    def product
      "#{brand} #{product_name}"
    end

    def letters(n)
      max = n.is_a?(Range) ? fetch_sample(n.to_a) : n
      (0...max).map { fetch_sample(LETTERS).upcase }.join
    end

    def model
      case rand(0..1)
      when 0 then "#{fetch_sample(LETTERS).upcase}#{rand(90)}" # N90
      when 1 then "#{letters(1..rand(1..2))}-#{rand(9900)}" # N-9400
      end
    end
  end
end
