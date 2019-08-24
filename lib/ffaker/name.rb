# frozen_string_literal: true

module FFaker
  module Name
    extend ModuleUtils
    extend self

    MALE_PREFIXES = %w[Mr.].freeze
    FEMALE_PREFIXES = %w[Mrs. Miss.].freeze
    OTHER_PREFIXES =  %w[Ms. Dr.].freeze
    PREFIXES = (MALE_PREFIXES + FEMALE_PREFIXES + OTHER_PREFIXES).freeze
    FIRST_NAMES = (FIRST_NAMES_FEMALE + FIRST_NAMES_MALE).freeze
    SUFFIXES = %w[Jr. Sr. I II III IV V MD DDS PhD DVM].freeze

    def name
      "#{first_name} #{last_name}"
    end

    def html_safe_name
      "#{first_name} #{html_safe_last_name}"
    end

    def name_with_prefix
      fetch_sample(
        [
          female_name_with_prefix,
          male_name_with_prefix
        ]
      )
    end

    def name_with_suffix
      fetch_sample(
        [
          female_name_with_suffix,
          male_name_with_suffix
        ]
      )
    end

    def name_with_prefix_suffix
      fetch_sample(
        [
          female_name_with_prefix_suffix,
          male_name_with_prefix_suffix
        ]
      )
    end

    def female_name_with_prefix
      "#{female_prefix} #{first_name_female} #{last_name}"
    end

    def male_name_with_prefix
      "#{male_prefix} #{first_name_male} #{last_name}"
    end

    def female_name_with_suffix
      "#{first_name_female} #{last_name} #{suffix}"
    end

    def male_name_with_suffix
      "#{first_name_male} #{last_name} #{suffix}"
    end

    def female_name_with_prefix_suffix
      "#{female_prefix} #{first_name_female} #{last_name} #{suffix}"
    end

    def male_name_with_prefix_suffix
      "#{male_prefix} #{first_name_male} #{last_name} #{suffix}"
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

    def html_safe_last_name
      loop do
        t = LAST_NAMES.sample
        return t unless t.include? "'"
      end
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

    def other_prefix
      fetch_sample(OTHER_PREFIXES)
    end

    def suffix
      fetch_sample(SUFFIXES)
    end

    def pronouns
      fetch_sample(PRONOUNS)
    end
  end
end
