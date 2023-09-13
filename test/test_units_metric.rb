# frozen_string_literal: true

require_relative 'helper'

class TestUnitsMetric < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::UnitMetric,
    :length_name, :length_abbr, :mass_name, :mass_abbr,
    :liquid_name, :liquid_abbr, :volume_name, :volume_abbr,
    :area_name, :area_abbr
  )

  def setup
    @tester = FFaker::UnitMetric
    @length_units = @tester::LENGTH_UNITS
    @mass_units = @tester::MASS_UNITS
    @liquid_units = @tester::LIQUID_UNITS
    @volume_units = @tester::VOLUME_UNITS
    @area_units = @tester::AREA_UNITS
  end

  def test_length_name
    assert_include @length_units.map { |unit| unit[:name] }, @tester.length_name
  end

  def test_length_abbrev
    assert_include @length_units.map { |unit| unit[:abbreviation] }, @tester.length_abbr
  end

  def test_mass_name
    assert_include @mass_units.map { |unit| unit[:name] }, @tester.mass_name
  end

  def test_mass_abbr
    assert_include @mass_units.map { |unit| unit[:abbreviation] }, @tester.mass_abbr
  end

  def test_liquid_name
    assert_include @liquid_units.map { |unit| unit[:name] }, @tester.liquid_name
  end

  def test_liquid_abbr
    assert_include @liquid_units.map { |unit| unit[:abbreviation] }, @tester.liquid_abbr
  end

  def test_volume_name
    assert_include @volume_units.map { |unit| unit[:name] }, @tester.volume_name
  end

  def test_volume_abbr
    assert_include @volume_units.map { |unit| unit[:abbreviation] }, @tester.volume_abbr
  end

  def test_area_name
    assert_include @area_units.map { |unit| unit[:name] }, @tester.area_name
  end

  def test_area_abbr
    assert_include @area_units.map { |unit| unit[:abbreviation] }, @tester.area_abbr
  end
end
