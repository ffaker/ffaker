# encoding: utf-8

require 'ffaker/name'

module FFaker
  module NameDE
    include FFaker::Name

    extend ModuleUtils
    extend self

    PREFIXES = %w[Herr Frau Dr. Prof.].freeze

    def name
      case rand(0..9)
      when 0 then "#{prefix} #{first_name} #{last_name}"
      else "#{first_name} #{last_name}"
      end
    end

    def first_name
      fetch_sample(FIRST_NAMES)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def prefix
      fetch_sample(PREFIXES)
    end
  end
end
