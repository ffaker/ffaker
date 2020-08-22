# frozen_string_literal: true

module FFaker
  module NameRU
    extend ModuleUtils
    extend self

    FIRST_NAMES = FIRST_NAMES_MALE + FIRST_NAMES_FEMALE
    LAST_NAMES = LAST_NAMES_MALE + LAST_NAMES_FEMALE

    def name
      rand(0..1).zero? ? female_name : male_name
    end

    def first_name
      fetch_sample(FIRST_NAMES)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def female_name
      "#{first_name_female} #{last_name_female}"
    end

    def male_name
      "#{first_name_male} #{last_name_male}"
    end

    def first_name_female
      fetch_sample(FIRST_NAMES_FEMALE)
    end

    def first_name_male
      fetch_sample(FIRST_NAMES_MALE)
    end

    def middle_name_female
      fetch_sample(MIDDLE_NAMES_FEMALE)
    end

    def middle_name_male
      fetch_sample(MIDDLE_NAMES_MALE)
    end

    def last_name_female
      fetch_sample(LAST_NAMES_FEMALE)
    end

    def last_name_male
      fetch_sample(LAST_NAMES_MALE)
    end
  end
end
