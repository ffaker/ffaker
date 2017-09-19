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
      fetch_sample(FIRST_NAMES_FEMALE)
    end

    def first_name_male
      fetch_sample(FIRST_NAMES_MALE)
    end

    def middle_name_female
      fetch_sample(MIDDLE_NAMES_FEMALE)
    end

    def middle_name_male
      fetch_sample(MIDDLE_NAMES_MALE)
    end

    def last_name_female
      fetch_sample(LAST_NAMES_FEMALE)
    end

    def last_name_male
      fetch_sample(LAST_NAMES_MALE)
    end

    def first_name
      fetch_sample(FIRST_NAMES)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def name
      case rand(0..7)
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
