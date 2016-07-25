# encoding: utf-8

module FFaker
  module LoremJA
    extend ModuleUtils
    extend self

    def character
      CHARACTERS.sample
    end

    def characters(count = 20)
      CHARACTERS.sample(count).join
    end

    def word
      WORDS.sample
    end

    def words(count = 3)
      WORDS.sample(count)
    end

    def sentence
      SENTENCES.sample
    end

    def sentences(count = 3)
      (1..count).map { SENTENCES.sample }
    end

    def paragraph(sentence_count = 3)
      sentences(sentence_count).join('、') + '、' + SENTENCES_END.sample + '。'
    end

    def paragraphs(count = 3)
      (1..count).map { paragraph }
    end
  end
end
