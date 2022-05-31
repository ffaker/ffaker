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
  end
end
