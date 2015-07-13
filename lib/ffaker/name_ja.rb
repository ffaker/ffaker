# encoding: utf-8

module FFaker
  module NameJA
    extend ModuleUtils
    extend self

    def first_name
      FIRST_NAMES.sample
    end

    def last_name
      LAST_NAMES.sample
    end

    def last_first
      "#{last_name}#{first_name}"
    end

    alias_method :name, :last_first
  end
end
