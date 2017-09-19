# encoding: utf-8

require 'ffaker/name'

module FFaker
  module NameSE
    include FFaker::Name

    extend ModuleUtils
    extend self

    PREFIXES = %w[Dr. Prof.].freeze

    def name
      case rand(0..29)
      when 0 then "#{prefix} #{first_name} #{last_name}"
      else        "#{first_name} #{last_name}"
      end
    end

    def first_name
      case rand(0..11)
      when 0..4  then first_name_female
      when 5..9  then first_name_male
      when 10    then "#{first_name_male} #{first_name_male}"
      when 11    then "#{first_name_female} #{first_name_female}"
      end
    end

    def first_name_female
      fetch_sample(FIRST_NAMES_FEMALE)
    end

    def first_name_male
      fetch_sample(FIRST_NAMES_MALE)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def prefix
      fetch_sample(PREFIXES)
    end
  end
end
