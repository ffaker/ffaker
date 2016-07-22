# encoding: utf-8

require 'ffaker/unit'
require 'ostruct'

module FFaker
  module UnitMetric
    include FFaker::Unit

    extend ModuleUtils
    extend self

    LENGTH_UNITS = [
      { name: 'millimeters', abbreviation: 'mm' },
      { name: 'centimeters', abbreviation: 'cm' },
      { name: 'meters', abbreviation: 'm' },
      { name: 'kilometers', abbreviation: 'km' }
    ].freeze
    MASS_UNITS = [
      { name: 'gram', abbreviation: 'g' },
      { name: 'kilogram', abbreviation: 'kg' },
      { name: 'metric ton', abbreviation: 'mt' }
    ].freeze
    LIQUID_UNITS = [
      { name: 'milliliters', abbreviation: 'ml' },
      { name: 'liters', abbreviation: 'L' }
    ].freeze
    VOLUME_UNITS = [
      { name: ' cubic centimeters', abbreviation: 'cm^3' },
      { name: 'cubic meters', abbreviation: 'm^3' }
    ].freeze
    AREA_UNITS = [
      { name: 'centimeters squared', abbreviation: 'cm^2' },
      { name: 'meters squared', abbreviation: 'm^2' },
      { name: 'hectares', abbreviation: 'ha' },
      { name: 'kilometers', abbreviation: 'km' }
    ].freeze

    def mass_name
      mass.name
    end

    def mass_abbr
      mass.abbreviation
    end

    def length_name
      length.name
    end

    def length_abbr
      length.abbreviation
    end

    def liquid_name
      liquid.name
    end

    def liquid_abbr
      liquid.abbreviation
    end

    def volume_name
      volume.name
    end

    def volume_abbr
      volume.abbreviation
    end

    def area_name
      area.name
    end

    def area_abbr
      area.abbreviation
    end

    private

    def length
      OpenStruct.new(fetch_sample(LENGTH_UNITS))
    end

    def mass
      OpenStruct.new(fetch_sample(MASS_UNITS))
    end

    def liquid
      OpenStruct.new(fetch_sample(LIQUID_UNITS))
    end

    def volume
      OpenStruct.new(fetch_sample(VOLUME_UNITS))
    end

    def area
      OpenStruct.new(fetch_sample(AREA_UNITS))
    end
  end
end
