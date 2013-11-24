# encoding: utf-8

require 'ffaker/name'

module Faker
  module NameDE
    include Faker::Name

    extend ModuleUtils
    extend self

    def name
      case rand(10)
      when 0 then "#{prefix} #{first_name} #{last_name}"
      else 	  "#{first_name} #{last_name}"
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

    PREFIXES = k %w(Herr Frau Dr. Prof.)
  end
end
