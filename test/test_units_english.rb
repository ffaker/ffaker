# encoding: utf-8

require 'helper'

# Author: lurraca github.com/lurraca
class TestUnitsEnglish < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::UnitEnglish,
    :length_name, :length_abbr, :mass_name, :mass_abbr,
    :liquid_name, :liquid_abbr, :volume_name, :volume_abbr,
    :area_name, :area_abbr
  )

  def setup
    @tester = FFaker::UnitEnglish
    @length_units = @tester::LENGTH_UNITS.map { |u| OpenStruct.new u }
    @mass_units = @tester::MASS_UNITS.map { |u| OpenStruct.new u }
    @liquid_units = @tester::LIQUID_UNITS.map { |u| OpenStruct.new u }
    @volume_units = @tester::VOLUME_UNITS.map { |u| OpenStruct.new u }
    @area_units = @tester::AREA_UNITS.map { |u| OpenStruct.new u }
  end

  def test_length_name
    assert_include @length_units.map(&:name), @tester.length_name
  end

  def test_length_abbrev
    assert_include @length_units.map(&:abbreviation), @tester.length_abbr
  end

  def test_mass_name
    assert_include @mass_units.map(&:name), @tester.mass_name
  end

  def test_mass_abbr
    assert_include @mass_units.map(&:abbreviation), @tester.mass_abbr
  end

  def test_liquid_name
    assert_include @liquid_units.map(&:name), @tester.liquid_name
  end

  def test_liquid_abbr
    assert_include @liquid_units.map(&:abbreviation), @tester.liquid_abbr
  end

  def test_volume_name
    assert_include @volume_units.map(&:name), @tester.volume_name
  end

  def test_volume_abbr
    assert_include @volume_units.map(&:abbreviation), @tester.volume_abbr
  end

  def test_area_name
    assert_include @area_units.map(&:name), @tester.area_name
  end

  def test_area_abbr
    assert_include @area_units.map(&:abbreviation), @tester.area_abbr
  end
end
