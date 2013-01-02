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
      [
      "#{NOUNS.sample} 2: Electric Boogaloo",
      "The #{NOUNS.sample} Without a #{NOUNS.sample}",
      "The #{NOUNS.sample} from #{rand(20_000)} Leagues",
      "#{simple_title}: The #{Faker::Name.name} Story",
      "When #{Faker::Name.first_name} Met #{Faker::Name.first_name}",
      "Dr. #{NOUNS.sample}",
      "Je Vous Presente, #{Faker::Name.first_name}",
      "Rochelle, Rochelle",
      "Gandhi II",
      "#{rand(3000)} A.D.",
      "The #{NOUNS.sample} from #{Faker::Address.neighborhood}",
      "Christmas on #{Faker::Address.street_name}",
      "The #{ %w{ Red Yellow Black White }.sample } Rose of #{Faker::AddressUK.country}",
      "Hard Boiled #{NOUNS.sample}",
      String.new.tap{|s| n = simple_title; s.replace("#{n} 2: Son of #{n}") }
      ].sample
    end
  end
end
