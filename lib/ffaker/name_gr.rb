# encoding: utf-8

module FFaker
  # Author AntonyFalegkos<falegk1@gmail.com> github.com/falegk
  module NameGR
    extend ModuleUtils
    extend self

    # Random full name (male or female). Arguments :male, :female, :any
    def full_name(gender = :any)
      case gender
        when :any then (rand(2)==0) ? male_full_name : female_full_name
        when :male then male_full_name
        when :female then female_full_name
        else raise ArgumentError, "Invalid gender, must be one of :any, :male, :female"
      end
    end
    alias_method :name, :full_name

    # Random last name (male or female)
    def last_name
      case rand(2)
        when 0 then male_last_name
        when 1 then female_last_name
      end
    end

    # Random first name (male or female)
    def first_name
      case rand(2)
        when 0 then male_first_name
        when 1 then female_first_name
      end
    end

    def male_full_name
      "#{male_first_name} #{male_last_name}"
    end

    def female_full_name
      "#{female_first_name} #{female_last_name}"
    end

    def male_first_name
      MALE_FIRST_NAMES.sample
    end

    def male_last_name
      MALE_LAST_NAMES.sample
    end

    def female_first_name
      FEMALE_FIRST_NAMES.sample
    end

    def female_last_name
      FEMALE_LAST_NAMES.sample
    end

  end
end