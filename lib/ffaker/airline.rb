# encoding: utf-8

module FFaker
  module Airline
    extend ModuleUtils
    extend self

    def name
      NAMES_LIST.sample
    end

    def flight_number
      "#{CODES_LIST.sample} #{rand(1..3999)}"
    end 

  end
end
