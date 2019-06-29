# frozen_string_literal: true

module FFaker
  module NameAR
    extend ModuleUtils
    extend self

    def first_name_male
      fetch_sample(FIRST_NAMES_MALE)
    end

    def first_name_female
      fetch_sample(FIRST_NAMES_FEMALE)
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
  end
end
