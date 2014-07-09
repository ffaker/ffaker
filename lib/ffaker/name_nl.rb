# encoding: utf-8

require 'ffaker/name'

module Faker
  module NameNL
    include Faker::Name

    extend ModuleUtils
    extend self

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
      when 0 then [FIRST_NAMES_FEMALE.rand, FIRST_NAMES_FEMALE.rand].join('-')
      else FIRST_NAMES_FEMALE.rand
      end
    end

    def first_name_male
      case rand(8)
      when 0 then [FIRST_NAMES_MALE.rand, FIRST_NAMES_MALE.rand].join('-')
      else FIRST_NAMES_MALE.rand
      end
    end

    def last_name
      LAST_NAMES.rand
    end

    def prefix
      PREFIXES.rand
    end

    PREFIXES = k %w(Dr. Drs. Ir. Ing. Prof.)
  end
end
