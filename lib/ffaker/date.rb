# frozen_string_literal: true

require 'date'

module FFaker
  module Date
    extend FFaker::ModuleUtils
    extend self

    # Generates a random date between 2 dates
    def between(from, to)
      FFaker::Time.between(from, to).to_date
    end

    # Generates a random date up to `days` days in the past
    def backward(days = 365)
      from = ::Date.today - days
      to   = ::Date.today - 1

      between(from, to)
    end

    # Generates a random date up to `days` days in the future
    def forward(days = 365)
      from = ::Date.today + 1
      to   = ::Date.today + days

      between(from, to)
    end

    # Random birthday date (maximum age between 18 and 65)
    # Keyword arguments: min_age, max_age
    def birthday(min_age: 18, max_age: 65)
      from = ::Date.today.prev_year(max_age + 1).next_day
      to = ::Date.today.prev_year(min_age)

      between(from, to)
    end
  end
end
