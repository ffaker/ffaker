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
      "#{ CHEESY_SENTENCES.sample.capitalize } #{ CHEESY_SENTENCES.sample } #{ CHEESY_SENTENCES.sample }."
    end

    def paragraph(number_of_soundbites = 10)
      p = "#{CHEESY_SENTENCES.sample.capitalize }"
      number_of_soundbites.times do |s|
        s = " #{CHEESY_SENTENCES.sample}"
        p << s
      end
      p << "."
      puts p
    end
  end
end