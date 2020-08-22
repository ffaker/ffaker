# frozen_string_literal: true

module FFaker
  module LoremCN
    extend ModuleUtils
    extend self

    def word
      fetch_sample(WORDS)
    end

    def words(num = 3)
      fetch_sample(WORDS, count: num)
    end

    def sentence(word_count = 4)
      s = words(word_count + rand(0..5))
      s = s.join
      "#{s},"
    end

    def sentences(sentence_count = 3)
      s = (1..sentence_count).map { sentence }
      def s.to_s
        result = join(' ')
        result[-1] = '。'
        result
      end
      s
    end

    def paragraph(sentence_count = 3)
      sentences(sentence_count + rand(0..2)).to_s
    end

    def paragraphs(paragraph_count = 3)
      (1..paragraph_count).map { paragraph }
    end
  end
end
