# frozen_string_literal: true

module FFaker
  # Generates names from India
  # Source: https://www.momjunction.com/articles/popular-indian-last-names-for-your-baby_00334734/#gref
  # Source: https://www.babycenter.in/a25024464/top-100-boy-names-in-india-in-2017
  # Source: https://www.babycenter.in/a25024466/top-100-girl-names-in-india-in-2017
  module NameIN
    extend ModuleUtils
    extend self

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
