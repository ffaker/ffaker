# frozen_string_literal: true

module FFaker
  # guapolo github.com/guapolo
  module NameMX
    include FFaker::Name

    extend ModuleUtils
    extend self

    MALE_PREFIXES = %w[Sr. C.].freeze
    FEMALE_PREFIXES = %w[Sra. Srita. C.].freeze
    PREFIXES = %w[Sr. Sra. Srita. C.].freeze

    # Full name according to gender and prefix, possibly with middle_name
    def full_name(gender = :any, prefix = false)
      if prefix
        full_name_prefix(gender)
      else
        full_name_no_prefix(gender)
      end
    end

    # Full name with prefix according to gender, possibly with middle_name
    def full_name_prefix(gender = :any)
      case gender
      when :any
        case rand(0..8)
        when 0, 3, 6, 8 then "#{female_prefix} #{female_name} #{paternal_last_names}"
        else "#{male_prefix} #{male_name} #{paternal_last_names}"
        end
      when :male then "#{male_prefix} #{male_name} #{paternal_last_names}"
      when :female then "#{female_prefix} #{female_name} #{paternal_last_names}"
      else raise ArgumentError, 'Invalid gender, must be one of :any, :male, :female'
      end
    end

    # Full name with no prefix according to gender, possibly with middle_name
    def full_name_no_prefix(gender = :any)
      case gender
      when :any
        case rand(0..8)
        when 0, 3, 6, 8 then "#{female_name} #{paternal_last_names}"
        else "#{male_name} #{paternal_last_names}"
        end
      when :male then "#{male_name} #{paternal_last_names}"
      when :female then "#{female_name} #{paternal_last_names}"
      else raise ArgumentError, 'Invalid gender, must be one of :any, :male, :female'
      end
    end

    # Male first name and possibly middle name
    def male_name
      case rand(0..8)
      when 0, 5 then "#{first_name(:male)} #{middle_name(:male)}"
      else first_name(:male)
      end
    end

    # Female first name and possibly middle name
    def female_name
      case rand(0..8)
      when 0, 5 then "#{first_name(:female)} #{middle_name(:female)}"
      else first_name(:female)
      end
    end

    # A single name according to gender parameter
    def name(gender = :any)
      case gender
      when :any then rand(0..1).zero? ? name(:male) : name(:female)
      when :male then fetch_sample(MALE_FIRST_NAMES)
      when :female then fetch_sample(FEMALE_FIRST_NAMES)
      else raise ArgumentError, 'Invalid gender, must be one of :any, :male, :female'
      end
    end
    alias middle_name name
    alias first_name name

    # Father's and mother's last name
    def paternal_last_names
      "#{last_name} #{last_name}"
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def prefix
      fetch_sample(PREFIXES)
    end

    def male_prefix
      fetch_sample(MALE_PREFIXES)
    end

    def female_prefix
      fetch_sample(FEMALE_PREFIXES)
    end
  end
end
