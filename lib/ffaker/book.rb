# encoding: utf-8

module FFaker
  module Book
    extend ModuleUtils
    extend self

    def title
      case rand(0..1)
      when 0 then simple_title
      when 1 then title_with_prefix
      end
    end

    def genre
      fetch_sample(GENRES)
    end

    def author
      FFaker::Name.name
    end

    def isbn
      rand(1_000_000_000...25_000_000_000).to_s
    end

    def description(sentence_count = 3)
      FFaker::Lorem.paragraph(sentence_count)
    end

    def cover(slug = nil, size = '300x300', format = 'png', bgset = nil)
      FFaker::Avatar.image(slug, size, format, bgset)
    end

    private

    def simple_title
      "#{fetch_sample(ADJ_AND_ADV)} #{fetch_sample(NOUNS)}"
    end

    def title_with_prefix
      "#{fetch_sample(PREFIXES)} #{simple_title}"
    end
  end
end
