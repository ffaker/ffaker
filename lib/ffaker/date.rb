# encoding: utf-8

# => Author: Vitor Oliveira <vitormil@gmail.com>
# => Transfered By: Anthony Humes <jah.humes@gmail.com>

module Faker
  module Date
    extend ModuleUtils
    extend self

    def between(from, to)
      from = get_date_object(from)
      to   = get_date_object(to)

      rand_in_range(from, to)
    end

    def forward(days = 365)
      from = ::Date.today + 1
      to   = ::Date.today + days

      between(from, to).to_date
    end

    def backward(days = 365)
      from = ::Date.today - days
      to   = ::Date.today - 1

      between(from, to).to_date
    end

    private

    def get_date_object(date)
      date = ::Date.parse(date) if date.is_a?(String)
      date = date.to_date if date.respond_to?(:to_date)
      date
    end
  end
end
