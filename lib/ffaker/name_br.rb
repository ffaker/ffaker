# encoding: utf-8

module FFaker
  module NameBR
    extend ModuleUtils
    extend self

    MALE_PREFIXES = %w(Sr.).freeze
    FEMALE_PREFIXES = %w(Sra. Srta.).freeze
    PREFIXES = (MALE_PREFIXES + FEMALE_PREFIXES).freeze
    FIRST_NAMES = (FIRST_NAMES_FEMALE + FIRST_NAMES_MALE).freeze

    def name
      "#{first_name} #{last_name}"
    end

    def name_with_prefix
      [
        female_name_with_prefix,
        male_name_with_prefix
      ].sample
    end

    def female_name_with_prefix
      "#{female_prefix} #{first_name_female} #{last_name}"
    end

    def male_name_with_prefix
      "#{male_prefix} #{first_name_male} #{last_name}"
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
  end
end
