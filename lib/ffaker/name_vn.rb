# encoding: utf-8

module FFaker
  module NameVN
    extend ModuleUtils
    extend self

    def name
      "#{middle_name} #{first_name} #{last_name}"
    end

    def first_name
      fetch_sample(FIRST_NAMES)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def middle_name
      fetch_sample(MIDDLE_NAMES)
    end

    def last_first
      "#{last_name} #{middle_name} #{first_name}"
    end
  end
end
