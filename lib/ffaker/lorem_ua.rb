# encoding: utf-8

module FFaker
  module LoremUA
    extend ModuleUtils
    extend self

    def word
      WORDS.sample
    end

    def words(num = 3)
      WORDS.sample(num)
    end

    def sentence(word_count = 7)
      elements = words(word_count + rand(10))
      if elements.count > 10
        elements.insert(rand(3..(elements.count - 3)), ',')
      end
      result = elements.join(' ').gsub(' , ', ', ')
      capitalize_ukrainian("#{result}#{sentence_type_mark}")
    end

    alias_method :phrase, :sentence

    def sentences(sentence_count = 3)
      (1..sentence_count).map { sentence }
    end

    alias_method :phrases, :sentences

    def paragraph(sentence_count = 5)
      sentences(sentence_count + rand(3)).join(' ')
    end

    def paragraphs(paragraph_count = 3)
      (1..paragraph_count).map { paragraph }
    end

    private

    def sentence_type_mark
      case rand(10)
      when 0..7 then "."
      when 8    then "!"
      when 9    then "?"
      end
    end

    def capitalize_ukrainian(string)
      unless CAPITAL_CHARS.include?(string[0])
        string[0] = CAPITAL_CHARS[CHARS.index(string[0])]
      end
      string
    end
  end
end

