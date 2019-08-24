# frozen_string_literal: true

module FFaker
  # Source: http://www.thai-language.com/
  module NameTH
    extend ModuleUtils
    extend self

    def first_name
      fetch_sample(FIRST_NAMES)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def nick_name
      fetch_sample(NICK_NAMES)
    end

    def name
      "#{first_name} #{last_name}"
    end
  end
end
