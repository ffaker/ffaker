# frozen_string_literal: true

module FFaker
  module CheesyLingo
    # Born during RailsGirls Summer of Code 2015. Team Cheesy says Hi!

    extend ModuleUtils
    extend self

    TITLE_1 = %w[Sharp Soft Nutty Smokey Melting Cheeky Fat Dutch Grated Cheesed Milky].freeze
    TITLE_2 = %w[Gouda Affineurs Alpine Sheep Cows Brie Goats Coulommiers Dairy].freeze

    def title
      "#{fetch_sample(TITLE_1)} #{fetch_sample(TITLE_2)}"
    end

    def word
      fetch_sample(CHEESY_WORDS)
    end

    def words(count = 5)
      fetch_sample(CHEESY_WORDS, count: count)
    end

    def sentence
      [
        fetch_sample(CHEESY_PHRASES).capitalize,
        fetch_sample(CHEESY_PHRASES),
        fetch_sample(CHEESY_PHRASES)
      ].join + '.'
    end

    def paragraph(number_of_phrases = 10)
      p = +fetch_sample(CHEESY_PHRASES).capitalize
      (number_of_phrases - 1).times { p << " #{fetch_sample(CHEESY_PHRASES)}" }
      p << '.'
    end
  end
end
