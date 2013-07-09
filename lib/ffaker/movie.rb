module Faker
  module Movie
    extend ModuleUtils
    extend self

    def title
      case rand(4)
      when 0 then title_with_prefix
      when 1 then title_with_suffix
      when 2 then simple_title
      when 3 then title_from_formula
      end
    end

    PREFIXES = k [ "Time of the", "Season of the", "Return of the", "I am", "Planet of the", "War of the",
      "Invasion of the", "I Married a", "Legend of", "Codename:", "Case of the Missing", "Day of the", "Curse of the",
      "Rise of the", "The", "A Fistful of", "Journey of the" ]
    ADJ_AND_ADV = k %w{ Action Hungry Ultra Dangerous Danger Tokyo Red Blue Green Killer Electric Blonde Flying
      Forbidden Nuclear Fake American Death Champagne Bloody }
    NOUNS = k %w{ Wolf Wolves Cousins Jungle Witch Woman Women Man Men Identity Ninja Ninjas Pickpocket Hills Clash
      Wizard World Brain Brains Fly Mutant Blow Diaries Gypsy Diaries Dreams Tears City Cat Tentacle Friday Rain Thief
      Beast Demon Monster }
    SUFFIXES = k [ "from Hell", "from Outer Space", "from Mars", "from the Black Lagoon", "with a Thousand Faces",
      "from Across the Ocean", "Who Fell to Earth", "That Came to Dinner"]
    COLORS = k %w{Red Yellow Black White}
    private

    def title_with_prefix
      "#{PREFIXES.rand} #{maybe_adj_or_adv}#{NOUNS.rand}"
    end

    def title_with_suffix
      "The #{maybe_adj_or_adv}#{NOUNS.rand} #{SUFFIXES.rand}"
    end

    def maybe_adj_or_adv
      if rand(2) == 1
        ADJ_AND_ADV.rand + " "
      end
    end

    def simple_title
      "#{ADJ_AND_ADV.rand} #{NOUNS.rand}"
    end

    def title_from_formula
      case rand(13)
      when 0 then "#{NOUNS.rand} 2: Electric Boogaloo"
      when 1 then "The #{NOUNS.rand} Without a #{NOUNS.rand}"
      when 2 then "The #{NOUNS.rand} from #{rand(20_000)} Leagues"
      when 3 then "#{simple_title}: The #{Faker::Name.name} Story"
      when 4 then "When #{Faker::Name.first_name} Met #{Faker::Name.first_name}"
      when 5 then "Dr. #{NOUNS.rand}"
      when 6 then "Je Vous Presente, #{Faker::Name.first_name}"
      when 7 then "#{rand(3000)} A.D."
      when 8 then "The #{NOUNS.rand} from #{Faker::Address.neighborhood}"
      when 9 then "Christmas on #{Faker::Address.street_name}"
      when 10 then "The #{COLORS.rand} Rose of #{Faker::AddressUK.country}"
      when 11 then "Hard Boiled #{NOUNS.rand}"
      else
        ::String.new.tap{|s| n = simple_title; s.replace("#{n} 2: Son of #{n}")}
      end
    end
  end
end
