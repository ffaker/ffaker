# frozen_string_literal: true
# encoding: utf-8

module FFaker
  module NameTW
    extend ModuleUtils
    extend self

    def name
      "#{last_name}#{first_name}"
    end

    def first_name
      fetch_sample(FIRST_NAMES)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end
  end
end
