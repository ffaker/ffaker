# encoding: utf-8

module FFaker
  module Book
    extend ModuleUtils
    extend self

    def title
      case rand(2)
      when 0 then simple_title
      when 1 then title_with_prefix
      end
    end

    def genre
      GENRES.sample
    end

    def author
      FFaker::Name.name
    end

    def isbn
      (Kernel.rand(24_000_000_000) + 1_000_000_000).to_s
    end

    def description(sentence_count = 3)
      FFaker::Lorem.paragraph(sentence_count)
    end

    def cover(slug = nil, size = '300x300', format = 'png', bgset = nil)
      FFaker::Avatar.image(slug, size, format, bgset)
    end

    private

    def simple_title
      "#{ADJ_AND_ADV.sample} #{NOUNS.sample}"
    end

    def title_with_prefix
      "#{PREFIXES.sample} #{simple_title}"
    end
  end
end
