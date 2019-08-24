# frozen_string_literal: true

module FFaker
  module Movie
    extend ModuleUtils
    extend self

    SUFFIXES = [
      'from Hell', 'from Outer Space', 'from Mars', 'from the Black Lagoon',
      'with a Thousand Faces', 'from Across the Ocean', 'Who Fell to Earth', 'That Came to Dinner'
    ].freeze
    COLORS = %w[Red Yellow Black White].freeze

    RATINGS = %w[G PG PG-13 R NC-17].freeze # According to MPAA

    def title
      case rand(0..3)
      when 0 then title_with_prefix
      when 1 then title_with_suffix
      when 2 then simple_title
      when 3 then title_from_formula
      end
    end

    def rating
      fetch_sample(RATINGS)
    end

    private

    def title_with_prefix
      "#{fetch_sample(PREFIXES)} #{maybe_adj_or_adv}#{fetch_sample(NOUNS)}"
    end

    def title_with_suffix
      "The #{maybe_adj_or_adv}#{fetch_sample(NOUNS)} #{fetch_sample(SUFFIXES)}"
    end

    def maybe_adj_or_adv
      fetch_sample(ADJ_AND_ADV) + ' ' if rand(0..1) == 1
    end

    def simple_title
      "#{fetch_sample(ADJ_AND_ADV)} #{fetch_sample(NOUNS)}"
    end

    def title_from_formula
      case rand(0..12)
      when 0 then "#{fetch_sample(NOUNS)} 2: Electric Boogaloo"
      when 1 then "The #{fetch_sample(NOUNS)} Without a #{fetch_sample(NOUNS)}"
      when 2 then "The #{fetch_sample(NOUNS)} from #{rand(0...20_000)} Leagues"
      when 3 then "#{simple_title}: The #{FFaker::Name.name} Story"
      when 4 then "When #{FFaker::Name.first_name} Met #{FFaker::Name.first_name}"
      when 5 then "Dr. #{fetch_sample(NOUNS)}"
      when 6 then "Je Vous Presente, #{FFaker::Name.first_name}"
      when 7 then "#{rand(0...2999)} A.D."
      when 8 then "The #{fetch_sample(NOUNS)} from #{FFaker::Address.neighborhood}"
      when 9 then "Christmas on #{FFaker::Address.street_name}"
      when 10 then "The #{fetch_sample(COLORS)} Rose of #{FFaker::AddressUK.country}"
      when 11 then "Hard Boiled #{fetch_sample(NOUNS)}"
      else
        ::String.new.tap do |string|
          title = simple_title
          string.replace("#{title} 2: Son of #{title}")
        end
      end
    end
  end
end
