# encoding: utf-8

require 'ffaker/name'

module Faker
  module NameDA
    include Faker::Name

    extend ModuleUtils
    extend self

    def name gender = :any
      case gender
      when :any then any_name
      when :male then male_name
      when :female then female_name
      else
        raise ArgumentError, "Invalid gender, must be one of :any, :male, :female"
      end
    end

    def any_name
      case rand(8)
      when 0    then "#{prefix} #{first_name} #{last_name}"
      when 1..2 then "#{first_name} #{last_name} #{last_name}"
      else           "#{first_name} #{last_name}"
      end
    end

    def male_name
      fname = first_name :male
      case rand(8)
      when 0    then "#{prefix} #{fname} #{last_name}"
      when 1..2 then "#{fname} #{last_name} #{last_name}"
      else           "#{fname} #{last_name}"
      end
    end

    def female_name
      fname = first_name :female
      case rand(8)
      when 0    then "#{prefix} #{fname} #{last_name}"
      when 1..2 then "#{fname} #{last_name} #{last_name}"
      else           "#{fname} #{last_name}"
      end
    end

    def first_name gender = :any
      case gender
      when :any then (rand(2) == 0) ? name(:male) : name(:female)
      when :male then MALE_FIRST_NAMES.rand
      when :female then FEMALE_FIRST_NAMES.rand
      else
        raise ArgumentError, "Invalid gender, must be one of :any, :male, :female"
      end
    end

    def last_name
      LAST_NAMES.rand
    end

    def prefix
      PREFIXES.rand
    end

    PREFIXES = k %w(Hr. Fr. Dr. Prof.)
  end
end
