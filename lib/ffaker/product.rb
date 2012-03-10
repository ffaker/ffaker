module Faker
  module Product
    extend ModuleUtils
    extend self

    def brand
      case rand(12)
        when (0..4) then B1.rand + B2.rand
        when (5..10) then "#{START.rand}#{VOWELS.rand}#{SUFFIX.rand}#{ADDON.rand if rand(2)==0}".capitalize
        when 11 then "#{letters(2..3)}"
      end
    end

    def product_name
      case rand(2)
      when 0 then "#{ADJ.rand} #{NOUN.rand}"
      when 1 then "#{[ADJ.rand, ADJ.rand].uniq.join(" ")} #{NOUN.rand}"
      end
    end

    def product
      "#{brand} #{product_name}"
    end

    def letters(n)
      max = n.is_a?(Range) ? n.to_a.shuffle.first : n
      (0...max).map { LETTERS.rand.upcase }.join
    end

    def model
      case rand(2)
      when 0 then "#{LETTERS.rand.upcase}#{rand(90)}"   # N90
      when 1 then "#{letters(1..rand(1..2))}-#{rand(9900)}"         # N-9400
      end
    end

    B1   = k %w(So Lu Sir Bri Reu Gen Fin Pana Sine Co Aqua Am Ca Cyg Tech After Sub One Tri)
    B2   = k %w(nix cell sync func balt sche pod)

    VOWELS = k %w(a e i o u ou ie y io)
    START  = k %w(tr br p ph)
    SUFFIX = k %w(ck ns nce nt st ne re ffe ph)
    ADDON  = k %w(wood forge func)

    ADJ  = k %w(Air Gel Auto Power Tag Audible HD GPS Portable Disc Electric Performance Side Video Input Output Direct Remote Digital)
    NOUN = k %w(Filter Compressor System Viewer Mount Case Adapter Amplifier Bridge Bracket Kit Transmitter Receiver Tuner Controller Component)
  end
end
