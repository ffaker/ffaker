# encoding: utf-8

module Faker
  module Name
    extend ModuleUtils
    extend self

    def name
      case rand(10)
      when 0 then "#{prefix} #{first_name} #{last_name}"
      when 1 then "#{first_name} #{last_name} #{suffix}"
      else        "#{first_name} #{last_name}"
      end
    end

    def first_name
      FIRST_NAMES.rand
    end

    def last_name
      LAST_NAMES.rand
    end

    def prefix
      PREFIXES.rand
    end

    def suffix
      SUFFIXES.rand
    end

    PREFIXES = k %w(Mr. Mrs. Ms. Miss Dr.)
    SUFFIXES = k %w(Jr. Sr. I II III IV V MD DDS PhD DVM)
  end
end
