# encoding: utf-8

require 'ffaker/unit'
require 'ostruct'

module FFaker
  module UnitEnglish
    include FFaker::Unit

    extend ModuleUtils
    extend self

    LENGTH_UNITS = [
      { name: 'inch', abbreviation: 'in' },
      { name: 'foot', abbreviation: 'ft' },
      { name: 'yard', abbreviation: 'yd' },
      { name: 'furlong', abbreviation: 'fur' },
      { name: 'mile', abbreviation: 'm' }
    ].freeze
    MASS_UNITS = [
      { name: 'grains', abbreviation: 'gr' },
      { name: 'ounces', abbreviation: 'oz' },
      { name: 'pounds', abbreviation: 'lb' },
      { name: 'hundredweight', abbreviation: 'cwt' },
      { name: 'ton', abbreviation: 't' }
    ].freeze
    LIQUID_UNITS = [
      { name: 'fluid ounce', abbreviation: 'fl oz' },
      { name: 'gill', abbreviation: 'gi' },
      { name: 'pint', abbreviation: 'pt' },
      { name: 'quart', abbreviation: 'qt' }
    ].freeze
    VOLUME_UNITS = [
      { name: 'cubic inch', abbreviation: 'CI' },
      { name: 'cubic foot', abbreviation: 'CFT' },
      { name: 'cubic yard', abbreviation: 'CY' }
    ].freeze
    AREA_UNITS = [
      { name: 'square inch', abbreviation: 'sq. in' },
      { name: 'square foot', abbreviation: 'sq ft' },
      { name: 'square yard', abbreviation: 'sq yd' },
      { name: 'acre', abbreviation: 'ac' },
      { name: 'section', abbreviation: 's' },
      { name: 'square mile', abbreviation: 'sq mi' },
      { name: 'township', abbreviation: 'Twp' }
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
