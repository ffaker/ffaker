# encoding: utf-8

module FFaker
  module NameJA
    extend ModuleUtils
    extend self

    def first_name
      fetch_sample(FIRST_NAMES)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def last_first
      "#{last_name}#{first_name}"
    end

    alias name last_first
  end
end
