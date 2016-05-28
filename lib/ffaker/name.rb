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
      [
        female_name_with_prefix,
        male_name_with_prefix
      ].sample
    end

    def name_with_suffix
      [
        female_name_with_suffix,
        male_name_with_suffix
      ].sample
    end

    def name_with_prefix_suffix
      [
        female_name_with_prefix_suffix,
        male_name_with_prefix_suffix
      ].sample
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
      FIRST_NAMES.sample
    end

    def first_name_female
      FIRST_NAMES_FEMALE.sample
    end

    def first_name_male
      FIRST_NAMES_MALE.sample
    end

    def last_name
      LAST_NAMES.sample
    end

    def prefix
      PREFIXES.sample
    end

    def female_prefix
      FEMALE_PREFIXES.sample
    end

    def male_prefix
      MALE_PREFIXES.sample
    end

    def other_prefix
      OTHER_PREFIXES.sample
    end

    def suffix
      SUFFIXES.sample
    end
  end
end
