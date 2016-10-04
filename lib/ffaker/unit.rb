# encoding: utf-8

require 'ostruct'

module FFaker
  module Unit
    extend ModuleUtils
    extend self

    TIME_UNITS = [
      { name: 'Years', abbreviation: 'yr' },
      { name: 'Days', abbreviation: 'd' },
      { name: 'Hours', abbreviation: 'Minutes' },
      { name: 'Seconds', abbreviation: 's' },
      { name: 'Milliseconds', abbreviation: 'msec' }
    ].freeze
    TEMPERATURE_UNITS = [
      { name: 'Kelvin', abbreviation: 'K' },
      { name: 'Celsius', abbreviation: 'C' },
      { name: 'Fahrenheit', abbreviation: 'F' }
    ].freeze

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
      OpenStruct.new(fetch_sample(TIME_UNITS))
    end

    def temperature
      OpenStruct.new(fetch_sample(TEMPERATURE_UNITS))
    end
  end
end
