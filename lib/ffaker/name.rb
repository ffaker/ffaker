# encoding: utf-8

module FFaker
  module Name
    extend ModuleUtils
    extend self

    MALE_PREFIXES = %w(Mr.).freeze
    FEMALE_PREFIXES = %w(Mrs. Miss.).freeze
    OTHER_PREFIXES =  %w(Ms. Dr.).freeze
    PREFIXES = (MALE_PREFIXES + FEMALE_PREFIXES + OTHER_PREFIXES).freeze
    FIRST_NAMES = (FIRST_NAMES_FEMALE + FIRST_NAMES_MALE).freeze
    SUFFIXES = %w(Jr. Sr. I II III IV V MD DDS PhD DVM).freeze

    def name
      "#{first_name} #{last_name}"
    end

    def name_with_prefix
      fetch([
        female_name_with_prefix,
        male_name_with_prefix
      ])
    end

    def name_with_suffix
      fetch([
        female_name_with_suffix,
        male_name_with_suffix
      ])
    end

    def name_with_prefix_suffix
      fetch([
        female_name_with_prefix_suffix,
        male_name_with_prefix_suffix
      ])
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
      fetch(FIRST_NAMES)
    end

    def first_name_female
      fetch(FIRST_NAMES_FEMALE)
    end

    def first_name_male
      fetch(FIRST_NAMES_MALE)
    end

    def last_name
      fetch(LAST_NAMES)
    end

    def prefix
      fetch(PREFIXES)
    end

    def female_prefix
      fetch(FEMALE_PREFIXES)
    end

    def male_prefix
      fetch(MALE_PREFIXES)
    end

    def other_prefix
      fetch(OTHER_PREFIXES)
    end

    def suffix
      fetch(SUFFIXES)
    end
  end
end
