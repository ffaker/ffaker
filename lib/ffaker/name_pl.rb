# encoding: UTF-8
# frozen_string_literal: true

module FFaker
  # Author Walerian Sobczak <walerian.sobczak@gmail.com> github.com/walerian777
  # Inspirations:
  # https://pl.wiktionary.org/wiki/Indeks:Polski_-_Imiona
  # https://pl.wiktionary.org/wiki/Kategoria:Polskie_nazwiska_m%C4%99skie
  module NamePL
    extend ModuleUtils
    extend self

    GENDERS = %i[random female male].freeze
    MALE_PREFIXES = %w[Pan].freeze
    FEMALE_PREFIXES = %w[Pani].freeze
    ACADEMIC_DEGREE_PREFIXES = %w[lic. inż. mgr mgr\ inż. dr dr\ hab. prof.].freeze
    PREFIXES = (MALE_PREFIXES + FEMALE_PREFIXES + ACADEMIC_DEGREE_PREFIXES).freeze

    # Generates a random full name for a given gender (random by default).
    # Acceptable gender values: :random, :female, :male
    def name(gender = :random)
      name_for_gender(:full_name, gender)
    end

    alias full_name name

    def name_with_prefix(gender = :random)
      name_for_gender(:name_with_prefix, gender)
    end

    # Generates a random last name for a given gender (random by default).
    # Acceptable gender values: :random, :female, :male
    def last_name(gender = :random)
      name_for_gender(:last_name, gender)
    end

    # Generates a random first name for a given gender (random by default).
    # Acceptable gender values: :random, :female, :male
    def first_name(gender = :random)
      name_for_gender(:first_name, gender)
    end

    def female_name_with_prefix
      "#{female_prefix} #{female_full_name}"
    end

    def male_name_with_prefix
      "#{male_prefix} #{male_full_name}"
    end

    def female_full_name
      "#{female_first_name} #{female_last_name}"
    end

    def male_full_name
      "#{male_first_name} #{male_last_name}"
    end

    def female_first_name
      fetch_sample(FEMALE_FIRST_NAMES)
    end

    def female_last_name
      fetch_sample(FEMALE_LAST_NAMES)
    end

    def male_first_name
      fetch_sample(MALE_FIRST_NAMES)
    end

    def male_last_name
      fetch_sample(MALE_LAST_NAMES)
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

    def academic_degree_prefix
      fetch_sample(ACADEMIC_DEGREE_PREFIXES)
    end

    private

    def name_for_gender(name_type, gender) # :nodoc:
      raise(ArgumentError, "Gender must be one of: #{GENDERS}") unless GENDERS.include?(gender)
      return send("#{gender}_#{name_type}") unless gender == :random
      fetch_sample([send("female_#{name_type}"), send("male_#{name_type}")])
    end
  end
end
