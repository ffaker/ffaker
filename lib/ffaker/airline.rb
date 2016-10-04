# encoding: utf-8

module FFaker
  module Airline
    extend ModuleUtils
    extend self

    def name
      fetch_sample(NAMES_LIST)
    end

    def flight_number
      "#{fetch_sample(CODES_LIST)} #{rand(1..3999)}"
    end
  end
end
