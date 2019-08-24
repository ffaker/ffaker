# frozen_string_literal: true

module FFaker
  module LoremUA
    extend ModuleUtils
    extend self

    def word
      fetch_sample(WORDS)
    end

    def words(num = 3)
      fetch_sample(WORDS, count: num)
    end

    def sentence(word_count = 7)
      elements = words(word_count + rand(0..9))
      elements.insert(rand(3..(elements.count - 3)), ',') if elements.count > 10
      result = elements.join(' ').gsub(' , ', ', ')
      capitalize_ukrainian(+"#{result}#{sentence_type_mark}")
    end

    alias phrase sentence

    def sentences(sentence_count = 3)
      (1..sentence_count).map { sentence }
    end

    alias phrases sentences

    def paragraph(sentence_count = 5)
      sentences(sentence_count + rand(0..2)).join(' ')
    end

    def paragraphs(paragraph_count = 3)
      (1..paragraph_count).map { paragraph }
    end

    private

    def sentence_type_mark
      case rand(0..9)
      when 0..7 then '.'
      when 8    then '!'
      when 9    then '?'
      end
    end

    def capitalize_ukrainian(string)
      string[0] = CAPITAL_CHARS[CHARS.index(string[0])] unless CAPITAL_CHARS.include?(string[0])
      string
    end
  end
end
