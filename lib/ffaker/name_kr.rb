# encoding: utf-8

module Faker
  module NameKR
    extend ModuleUtils
    extend self

    def name
      "#{last_name}#{first_name}"
    end

    def name_with_space
      "#{last_name} #{first_name}"
    end

    def first_name
      FIRST_NAMES.sample
    end

    def last_name
      LAST_NAMES.sample
    end

    alias_method :last_first, :name
  end
end
