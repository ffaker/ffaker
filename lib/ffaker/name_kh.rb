# frozen_string_literal: true

module FFaker
  module NameKH
    extend ModuleUtils
    extend self

    def name
      "#{last_name} #{first_name}"
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def first_name
      fetch_sample(FIRST_NAMES)
    end

    def nick_name
      fetch_sample(NICK_NAMES)
    end
  end
end
