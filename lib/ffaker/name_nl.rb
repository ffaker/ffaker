# encoding: utf-8

require 'ffaker/name'

module Faker
  module NameNL
    include Faker::Name

    extend ModuleUtils
    extend self

    PREFIXES = %w(Dr. Drs. Ir. Ing. Prof.)

    def name
      case rand(30)
      when 0 then "#{prefix} #{first_name} #{last_name}"
      else        "#{first_name} #{last_name}"
      end
    end

    def first_name
      case rand(2)
      when 0 then first_name_female
      when 1 then first_name_male
      end
    end

    def first_name_female
      case rand(8)
      when 0 then [FIRST_NAMES_FEMALE.sample, FIRST_NAMES_FEMALE.sample].join('-')
      else FIRST_NAMES_FEMALE.sample
      end
    end

    def first_name_male
      case rand(8)
      when 0 then [FIRST_NAMES_MALE.sample, FIRST_NAMES_MALE.sample].join('-')
      else FIRST_NAMES_MALE.sample
      end
    end

    def last_name
      LAST_NAMES.sample
    end

    def prefix
      PREFIXES.sample
    end
  end
end
