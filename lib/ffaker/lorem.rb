# encoding: utf-8

module FFaker
  # Based on Perl's Text::Lorem
  module Lorem
    extend ModuleUtils
    extend self

    def characters(character_count = 255)
      Array.new(character_count < 0 ? 0 : character_count).map { CHARACTERS.sample }.join
    end

    def word
      WORDS.sample
    end

    def words(num = 3)
      WORDS.sample(num)
    end

    def sentence(word_count = 4)
      first_word, *last_words = words(word_count + rand(5) + 1)
      if last_words.nil?
        first_word.capitalize
      else
        "#{first_word.capitalize} #{last_words.join(' ')}."
      end
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
