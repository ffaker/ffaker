# encoding: utf-8

module Faker
  module Product
    extend ModuleUtils
    extend self

    B2   = %w(nix cell sync func balt sche pod)
    VOWELS = %w(a e i o u ou ie y io)
    START  = %w(tr br p ph)
    SUFFIX = %w(ck ns nce nt st ne re ffe ph)
    ADDON  = %w(wood forge func)

    def brand
      case rand(12)
      when (0..4) then B1.sample + B2.sample
      when (5..10) then "#{START.sample}#{VOWELS.sample}#{SUFFIX.sample}#{ADDON.sample if rand(2)==0}".capitalize
      when 11 then "#{letters(2..3)}"
      end
    end

    def product_name
      case rand(2)
      when 0 then "#{ADJ.sample} #{NOUN.sample}"
      when 1 then "#{[ADJ.sample, ADJ.sample].uniq.join(" ")} #{NOUN.sample}"
      end
    end

    def product
      "#{brand} #{product_name}"
    end

    def letters(n)
      max = n.is_a?(Range) ? n.to_a.shuffle.first : n
      (0...max).map { LETTERS.sample.upcase }.join
    end

    def model
      case rand(2)
      when 0 then "#{LETTERS.sample.upcase}#{rand(90)}"   # N90
      when 1 then "#{letters(1..rand(1..2))}-#{rand(9900)}"         # N-9400
      end
    end
  end
end
