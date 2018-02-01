# frozen_string_literal: true
# encoding: UTF-8

module FFaker
  module LoremIE
    extend ModuleUtils
    extend self

    def word
      fetch_sample(WORDS)
    end

    def words(num = 3)
      fetch_sample(WORDS, count: num)
    end

    def sentence
      fetch_sample(SENTENCES)
    end

    alias phrase sentence

    def sentences(sentence_count = 3)
      (1..sentence_count).map { fetch_sample(SENTENCES) }
    end

    alias phrases sentences

    def paragraph(sentence_count = 3)
      sentences(sentence_count + rand(0..2)).join(' ')
    end

    def paragraphs(paragraph_count = 3)
      (1..paragraph_count).map { paragraph }
    end

    def question
      fetch_sample(QUESTIONS)
    end
  end
end
