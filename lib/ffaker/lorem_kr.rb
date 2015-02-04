# encoding: utf-8

module Faker
  module LoremKR
    extend ModuleUtils
    extend self

    def word
      WORDS.sample
    end

    def words(num = 3)
      WORDS.random_pick(num)
    end

    def sentence(word_count = 4)
      "#{words(word_count + rand(5) + 1).join(' ')}."
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
