# encoding: utf-8

module FFaker
  module Movie
    extend ModuleUtils
    extend self

    SUFFIXES = [
      "from Hell", "from Outer Space", "from Mars", "from the Black Lagoon", "with a Thousand Faces",
      "from Across the Ocean", "Who Fell to Earth", "That Came to Dinner"
    ]
    COLORS = %w{Red Yellow Black White}

    RATINGS = %w(G PG PG-13 R NC-17)  # According to MPAA

    def title
      case rand(4)
      when 0 then title_with_prefix
      when 1 then title_with_suffix
      when 2 then simple_title
      when 3 then title_from_formula
      end
    end

    def rating
      RATINGS.sample
    end

    private

    def title_with_prefix
      "#{PREFIXES.sample} #{maybe_adj_or_adv}#{NOUNS.sample}"
    end

    def title_with_suffix
      "The #{maybe_adj_or_adv}#{NOUNS.sample} #{SUFFIXES.sample}"
    end

    def maybe_adj_or_adv
      if rand(2) == 1
        ADJ_AND_ADV.sample + " "
      end
    end

    def simple_title
      "#{ADJ_AND_ADV.sample} #{NOUNS.sample}"
    end

    def title_from_formula
      case rand(13)
      when 0 then "#{NOUNS.sample} 2: Electric Boogaloo"
      when 1 then "The #{NOUNS.sample} Without a #{NOUNS.sample}"
      when 2 then "The #{NOUNS.sample} from #{rand(20_000)} Leagues"
      when 3 then "#{simple_title}: The #{FFaker::Name.name} Story"
      when 4 then "When #{FFaker::Name.first_name} Met #{FFaker::Name.first_name}"
      when 5 then "Dr. #{NOUNS.sample}"
      when 6 then "Je Vous Presente, #{FFaker::Name.first_name}"
      when 7 then "#{rand(3000)} A.D."
      when 8 then "The #{NOUNS.sample} from #{FFaker::Address.neighborhood}"
      when 9 then "Christmas on #{FFaker::Address.street_name}"
      when 10 then "The #{COLORS.sample} Rose of #{FFaker::AddressUK.country}"
      when 11 then "Hard Boiled #{NOUNS.sample}"
      else
        ::String.new.tap{|s| n = simple_title; s.replace("#{n} 2: Son of #{n}")}
      end
    end
  end
end
