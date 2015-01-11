# encoding: utf-8

require 'helper'

# Author: lurraca github.com/lurraca
class TestUnitsMetric < Test::Unit::TestCase
  def setup
    @tester = FFaker::UnitMetric
  end

  def test_length_name
    length_name = @tester.length_name
    assert FFaker::UnitMetric::LENGTH_UNITS.any?{ |hash| hash[:name] == length_name }
  end

  def test_length_abbrev
    length_abbr = @tester.length_abbr
    assert FFaker::UnitMetric::LENGTH_UNITS.any?{ |hash| hash[:abbreviation] == length_abbr }
  end

  def test_mass_name
    mass_name = @tester.mass_name
    assert FFaker::UnitMetric::MASS_UNITS.any?{ |hash| hash[:name] == mass_name }
  end

  def test_mass_abbr
    mass_abbr = @tester.mass_abbr
    assert FFaker::UnitMetric::MASS_UNITS.any?{ |hash| hash[:abbreviation] == mass_abbr }
  end

  def test_liquid_name
    liquid_name = @tester.liquid_name
    assert FFaker::UnitMetric::LIQUID_UNITS.any?{ |hash| hash[:name] == liquid_name }
  end

  def test_liquid_abbr
    liquid_abbr = @tester.liquid_abbr
    assert FFaker::UnitMetric::LIQUID_UNITS.any?{ |hash| hash[:abbreviation] == liquid_abbr }
  end

  def test_volume_name
    volume_name = @tester.volume_name
    assert FFaker::UnitMetric::VOLUME_UNITS.any?{ |hash| hash[:name] == volume_name }
  end

  def test_volume_abbr
    volume_abbr = @tester.volume_abbr
    assert FFaker::UnitMetric::VOLUME_UNITS.any?{ |hash| hash[:abbreviation] == volume_abbr }
  end

  def test_area_name
    area_name = @tester.area_name
    assert FFaker::UnitMetric::AREA_UNITS.any?{ |hash| hash[:name] == area_name }
  end

  def test_area_abbr
    area_abbr = @tester.area_abbr
    assert FFaker::UnitMetric::AREA_UNITS.any?{ |hash| hash[:abbreviation] == area_abbr }
  end

end
