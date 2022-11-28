# frozen_string_literal: true

module FFaker
  module JoJo
    extend ModuleUtils
    extend self

    def full_name
      fetch_sample(FULL_NAMES)
    end

    def first_name
      fetch_sample(FIRST_NAMES)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def stand
      fetch_sample(STANDS)
    end
  end
end
