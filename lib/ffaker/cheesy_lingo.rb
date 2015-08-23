# encoding: utf-8

module FFaker
  module CheesyLingo

    # Born during RailsGirls Summer of Code 2015. Team Cheesy says Hi!

    extend ModuleUtils
    extend self

    TITLE_1 = %w[Sharp Soft Nutty Smokey Melting Cheeky Fat Dutch Grated Cheesed Milky]
    TITLE_2 = %w[Gouda Affineurs Alpine Sheep Cows Brie Goats Coulommiers Dairy]

    def title
      "#{TITLE_1.sample} #{TITLE_2.sample}"
    end

    def word
      CHEESY_WORDS.sample
    end

    def words(count = 5)
      CHEESY_WORDS.sample(count)
    end

    def sentence
      "#{ CHEESY_PHRASES.sample.capitalize } #{ CHEESY_PHRASES.sample } #{ CHEESY_PHRASES.sample }."
    end

    def paragraph(number_of_phrases = 10)
      p = "#{ CHEESY_PHRASES.sample.capitalize }"
      (number_of_phrases-1).times do |s|
        s = " #{CHEESY_PHRASES.sample}"
        p << s
      end
      p << "."
    end
  end
end