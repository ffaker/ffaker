# encoding: utf-8

module FFaker
  module LoremJA
    extend ModuleUtils
    extend self

    def character
      fetch_sample(CHARACTERS)
    end

    def characters(count = 20)
      fetch_sample(CHARACTERS, count: count).join
    end

    def word
      fetch_sample(WORDS)
    end

    def words(count = 3)
      fetch_sample(WORDS, count: count)
    end

    def sentence
      fetch_sample(SENTENCES)
    end

    def sentences(count = 3)
      (1..count).map { fetch_sample(SENTENCES) }
    end

    def paragraph(sentence_count = 3)
      sentences(sentence_count).join('、') + '、' + fetch_sample(SENTENCES_END) + '。'
    end

    def paragraphs(count = 3)
      (1..count).map { paragraph }
    end
  end
end
