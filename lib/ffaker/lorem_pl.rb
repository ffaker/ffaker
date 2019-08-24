# frozen_string_literal: true

module FFaker
  # Inspirations:
  # https://pl.wiktionary.org
  module LoremPL
    extend ModuleUtils
    extend self

    def character
      fetch_sample(CHARACTERS)
    end

    def characters(count = 10)
      fetch_sample(CHARACTERS, count: count).join
    end

    def word
      fetch_sample(WORDS)
    end

    def words(count = 3)
      fetch_sample(WORDS, count: count)
    end

    def sentence(count = 7)
      sentence = words(count + rand(0..5))
      sentence[rand(3..(sentence.length - 3))] += ',' if sentence.length > 10
      sentence = sentence.join(' ')
      sentence = sentence.capitalize
      "#{sentence}#{end_of_sentence}"
    end

    alias phrase sentence

    def sentences(count = 3)
      (1..count).map { sentence }
    end

    alias phrases sentences

    def paragraph(count = 3)
      sentences(count + rand(0..2)).join(' ')
    end

    def paragraphs(count = 3)
      (1..count).map { paragraph }
    end

    private

    def end_of_sentence
      case rand(10)
      when 0..7 then '.'
      when 8 then '?'
      when 9 then '!'
      end
    end
  end
end
