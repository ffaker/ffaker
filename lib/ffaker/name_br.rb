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
  end
end
