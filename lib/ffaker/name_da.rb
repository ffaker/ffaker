# encoding: utf-8

require 'ffaker/name'

module FFaker
  module NameDA
    include FFaker::Name

    extend ModuleUtils
    extend self

    PREFIXES = %w(Hr. Fr. Dr. Prof.)

    def name(gender = :any)
      generate_name(first_name(gender))
    end

    def any_name
      name(:any)
    end

    def male_name
      name(:male)
    end

    def female_name
      name(:female)
    end

    def first_name(gender = :any)
      case gender
      when :any then (rand(2) == 0) ? first_name(:male) : first_name(:female)
      when :male then MALE_FIRST_NAMES.sample
      when :female then FEMALE_FIRST_NAMES.sample
      else
        fail ArgumentError, 'Invalid gender, must be one of :any, :male, :female'
      end
    end

    def last_name
      LAST_NAMES.sample
    end

    def prefix
      PREFIXES.sample
    end

    private

    def generate_name(first_name)
      case rand(8)
      when 0    then "#{prefix} #{first_name} #{last_name}"
      when 1..2 then "#{first_name} #{last_name} #{last_name}"
      else           "#{first_name} #{last_name}"
      end
    end
  end
end
