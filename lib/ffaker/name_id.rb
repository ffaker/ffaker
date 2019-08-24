# frozen_string_literal: true

module FFaker
  module NameID
    extend ModuleUtils
    extend self

    MALE_PREFIXES = %w[Tn.].freeze
    FEMALE_PREFIXES = %w[Ny. Nn.].freeze
    PREFIXES = (MALE_PREFIXES + FEMALE_PREFIXES).freeze
    FIRST_NAMES = (FIRST_NAMES_FEMALE + FIRST_NAMES_MALE).freeze

    def name
      "#{first_name} #{last_name}"
    end

    def name_with_prefix
      fetch_sample(
        [
          female_name_with_prefix,
          male_name_with_prefix
        ]
      )
    end

    def female_name_with_prefix
      "#{female_prefix} #{first_name_female} #{last_name}"
    end

    def male_name_with_prefix
      "#{male_prefix} #{first_name_male} #{last_name}"
    end

    def first_name
      fetch_sample(FIRST_NAMES)
    end

    def first_name_female
      fetch_sample(FIRST_NAMES_FEMALE)
    end

    def first_name_male
      fetch_sample(FIRST_NAMES_MALE)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def prefix
      fetch_sample(PREFIXES)
    end

    def female_prefix
      fetch_sample(FEMALE_PREFIXES)
    end

    def male_prefix
      fetch_sample(MALE_PREFIXES)
    end
  end
end
