# frozen_string_literal: true

module FFaker
  # Based on Perl's Text::Lorem
  module LoremBR
    extend ModuleUtils
    extend self

    def characters(character_count = 255)
      character_count = 0 if character_count.negative?
      Array.new(character_count).map { fetch_sample(CHARACTERS) }.join
    end

    def word
      fetch_sample(WORDS)
    end

    def words(num = 3)
      fetch_sample(WORDS, count: num)
    end

    def sentence(word_count = 4)
      first_word, *last_words = words(word_count + rand(1..5))
      return "#{first_word.capitalize} #{last_words.join(' ')}." if last_words

      first_word.capitalize
    end

    alias phrase sentence

    def sentences(sentence_count = 3)
      (1..sentence_count).map { sentence }
    end

    alias phrases sentences

    def paragraph(sentence_count = 3)
      sentences(sentence_count + rand(0..2)).join(' ')
    end

    def paragraphs(paragraph_count = 3)
      (1..paragraph_count).map { paragraph }
    end
  end
end
