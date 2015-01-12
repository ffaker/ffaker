# encoding: utf-8

require 'ffaker/name'

module Faker
  module NameDE
    include Faker::Name

    extend ModuleUtils
    extend self

    PREFIXES = %w(Herr Frau Dr. Prof.)

    def name
      case rand(10)
      when 0 then "#{prefix} #{first_name} #{last_name}"
      else 	  "#{first_name} #{last_name}"
      end
    end

    def first_name
      FIRST_NAMES.sample
    end

    def last_name
      LAST_NAMES.sample
    end

    def prefix
      PREFIXES.sample
    end
  end
end
