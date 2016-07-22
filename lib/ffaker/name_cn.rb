# encoding: utf-8

module FFaker
  module NameCN
    extend ModuleUtils
    extend self

    def name
      "#{first_name}#{last_name}"
    end

    def first_name
      fetch_sample(FIRST_NAMES)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def last_first
      "#{last_name}#{first_name}"
    end
  end
end
