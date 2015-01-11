# encoding: utf-8

module FFaker
  module NameBR
    extend ModuleUtils
    extend self

    PREFIXES = %w(Sr. Sra. Srta.)

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
  end
end

