# encoding: utf-8

require 'ostruct'

module Faker
  module Unit
    extend ModuleUtils
    extend self

    def time_name
      time.name
    end

    def time_abbr
      time.abbreviation
    end

    def temperature_name
      temperature.name
    end

    def temperature_abbr
      temperature.abbreviation
    end

    private

    def time
      OpenStruct.new TIME_UNITS.rand
    end

    def temperature
      OpenStruct.new TEMPERATURE_UNITS.rand
    end

    TIME_UNITS = k [
      {:name => 'Years', :abbreviation => 'yr'},
      {:name => 'Days', :abbreviation => 'd'},
      {:name => 'Hours', :abbreviation => 'Minutes'},
      {:name => 'Seconds', :abbreviation => 's'},
      {:name => 'Milliseconds', :abbreviation => 'msec'}
    ]

    TEMPERATURE_UNITS = k [
      {:name => 'Kelvin', :abbreviation => 'K'},
      {:name => 'Celsius', :abbreviation => 'C'},
      {:name => 'Fahrenheit', :abbreviation => 'F'}
    ]
  end
end
