# encoding: utf-8

module Faker
  # Source: http://www.thai-language.com/
  module NameTH
    extend ModuleUtils
    extend self

    def first_name
      FIRST_NAMES.rand
    end

    def last_name
      LAST_NAMES.rand
    end

    def nick_name
      NICK_NAMES.rand
    end

    def name
      "#{first_name} #{last_name}"
    end
  end
end
