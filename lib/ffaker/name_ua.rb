# encoding: utf-8

require 'ffaker/name'

module FFaker
  module NameUA
    extend ModuleUtils
    extend self

    FIRST_NAMES  = FIRST_NAMES_MALE + FIRST_NAMES_FEMALE
    LAST_NAMES   = LAST_NAMES_MALE + LAST_NAMES_FEMALE
    MIDDLE_NAMES = MIDDLE_NAMES_MALE + MIDDLE_NAMES_FEMALE

    def first_name_female
      FIRST_NAMES_FEMALE.sample
    end

    def first_name_male
      FIRST_NAMES_MALE.sample
    end

    def middle_name_female
      MIDDLE_NAMES_FEMALE.sample
    end

    def middle_name_male
      MIDDLE_NAMES_MALE.sample
    end

    def last_name_female
      LAST_NAMES_FEMALE.sample
    end

    def last_name_male
      LAST_NAMES_MALE.sample
    end

    def first_name
      FIRST_NAMES.sample
    end

    def last_name
      LAST_NAMES.sample
    end

    def name
      case rand(8)
      when 0 then first_name_male
      when 1 then first_name_female
      when 2 then "#{first_name_male} #{middle_name_male}"
      when 3 then "#{first_name_female} #{middle_name_male}"
      when 4 then "#{last_name_male} #{first_name_male}"
      when 5 then "#{last_name_female} #{first_name_female}"
      when 6 then "#{last_name_male} #{first_name_male} #{middle_name_male}"
      when 7 then "#{last_name_female} #{first_name_female} #{middle_name_female}"
      end
    end
  end
end
