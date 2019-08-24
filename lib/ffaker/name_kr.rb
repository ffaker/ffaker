# frozen_string_literal: true

module FFaker
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
      fetch_sample(FIRST_NAMES)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    alias last_first name
  end
end
