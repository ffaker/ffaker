require 'helper'

# Author: lurraca github.com/lurraca
class TestUnitsMetric < Minitest::Test
  def setup
    @tester = FFaker::UnitMetric
    @length_units = @tester::LENGTH_UNITS.map { |u| OpenStruct.new u }
    @mass_units = @tester::MASS_UNITS.map { |u| OpenStruct.new u }
    @liquid_units = @tester::LIQUID_UNITS.map { |u| OpenStruct.new u }
    @volume_units = @tester::VOLUME_UNITS.map { |u| OpenStruct.new u }
    @area_units = @tester::AREA_UNITS.map { |u| OpenStruct.new u }
  end

  def test_length_name
    assert_includes @length_units.map(&:name), @tester.length_name
  end

  def test_length_abbrev
    assert_includes @length_units.map(&:abbreviation), @tester.length_abbr
  end

  def test_mass_name
    assert_includes @mass_units.map(&:name), @tester.mass_name
  end

  def test_mass_abbr
    assert_includes @mass_units.map(&:abbreviation), @tester.mass_abbr
  end

  def test_liquid_name
    assert_includes @liquid_units.map(&:name), @tester.liquid_name
  end

  def test_liquid_abbr
    assert_includes @liquid_units.map(&:abbreviation), @tester.liquid_abbr
  end

  def test_volume_name
    assert_includes @volume_units.map(&:name), @tester.volume_name
  end

  def test_volume_abbr
    assert_includes @volume_units.map(&:abbreviation), @tester.volume_abbr
  end

  def test_area_name
    assert_includes @area_units.map(&:name), @tester.area_name
  end

  def test_area_abbr
    assert_includes @area_units.map(&:abbreviation), @tester.area_abbr
  end
end
