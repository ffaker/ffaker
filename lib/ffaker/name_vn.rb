# encoding: utf-8

module Faker
  module NameVN
    extend ModuleUtils
    extend self

    def name
      "#{middle_name} #{first_name} #{last_name}"
    end

    def first_name
      FIRST_NAMES.sample
    end

    def last_name
      LAST_NAMES.sample
    end

    def middle_name
      MIDDLE_NAMES.sample
    end

    def last_first
       "#{last_name} #{middle_name} #{first_name}"
    end
  end
end
