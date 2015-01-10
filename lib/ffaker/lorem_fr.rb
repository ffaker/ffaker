# encoding: UTF-8

module Faker
  module LoremFR
    extend ModuleUtils
    extend self

    def word
      WORDS.sample
    end

    def words(num = 3)
      WORDS.random_pick(num)
    end

    def sentence(word_count = 4)
      s = words(word_count + rand(6))
      s = s.join(' ')
      s.capitalize!
      "#{s}."
    end

    alias_method :phrase, :sentence

    def sentences(sentence_count = 3)
      (1..sentence_count).map { sentence }
    end

    alias_method :phrases, :sentences

    def paragraph(sentence_count = 3)
      sentences(sentence_count + rand(3)).join(' ')
    end

    def paragraphs(paragraph_count = 3)
      (1..paragraph_count).map { paragraph }
    end
  end
end
