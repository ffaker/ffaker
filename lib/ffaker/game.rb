# frozen_string_literal: true

module FFaker
  module Game
    extend ModuleUtils
    extend self

    def title
      case rand(0..1)
      when 0 then simple_title
      when 1 then title_with_prefix
      end
    end

    def category
      fetch_sample(CATEGORY)
    end

    def mechanic
      fetch_sample(MECHANIC)
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
