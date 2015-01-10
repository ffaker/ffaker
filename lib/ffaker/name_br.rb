# encoding: utf-8

module Faker
  module NameBR
    extend ModuleUtils
    extend self

    def name
      "#{first_name} #{last_name}"
    end

    def name_with_prefix
      "#{prefix} #{name}"
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

    PREFIXES = k %w(Sr. Sra. Srta.)
  end
end

