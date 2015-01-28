# encoding: utf-8

module Faker

  # Generates names from Gambia West Africa
  # Source: http://www.columbia.edu/~msj42/Common%20Gambian%20First%20Names.htm
  module NameGA
    extend ModuleUtils
    extend self

    LAST_NAMES = %w(jammeh ceesay)

    def first_name_female
      FIRST_NAMES_FEMALE.sample
    end

    def first_name_male
      FIRST_NAMES_MALE.sample
    end

    def last_name
      LAST_NAMES.sample
    end

    def name_male
      "#{first_name_male} #{last_name}"
    end

    def name_female
      "#{first_name_female} #{last_name}"
    end

    def name
      case rand(10)
      when 9 then name_female
      when 8 then name_male
      when 7 then name_female
      when 6 then name_male
      when 5 then name_female
      when 4 then name_male
      when 3 then name_female
      when 2 then name_male
      else name_female
      end
    end
  end
end
