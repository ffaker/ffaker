# encoding: utf-8

module FFaker
  # Generates names from Gambia West Africa
  # Source: http://www.columbia.edu/~msj42/Common%20Gambian%20First%20Names.htm
  module NameGA
    extend ModuleUtils
    extend self

    LAST_NAMES = %w[jammeh ceesay].freeze

    def first_name_female
      fetch_sample(FIRST_NAMES_FEMALE)
    end

    def first_name_male
      fetch_sample(FIRST_NAMES_MALE)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def name_male
      "#{first_name_male} #{last_name}"
    end

    def name_female
      "#{first_name_female} #{last_name}"
    end

    def name
      case rand(0..1)
      when 1 then name_male
      else name_female
      end
    end
  end
end
