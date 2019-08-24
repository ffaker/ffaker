# frozen_string_literal: true

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

    def paragraph
      fetch_sample(PARAGRAPHS)
    end

    def paragraphs(paragraph_count = 3)
      (1..paragraph_count).map { paragraph }
    end

    def question
      fetch_sample(QUESTIONS)
    end
  end
end
