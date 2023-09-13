# frozen_string_literal: true

require_relative 'helper'
require 'ostruct'

class TestUnits < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Unit,
    :time_name, :time_abbr, :temperature_name, :temperature_abbr
  )

  def setup
    @tester = FFaker::Unit
    @time_units = @tester::TIME_UNITS
    @temperature_units = @tester::TEMPERATURE_UNITS
  end

  def test_time_name
    assert_include @time_units.map { |unit| unit[:name] }, @tester.time_name
  end

  def test_time_abbr
    assert_include @time_units.map { |unit| unit[:abbreviation] }, @tester.time_abbr
  end

  def test_temperature_name
    assert_include @temperature_units.map { |unit| unit[:name] }, @tester.temperature_name
  end

  def test_temperature_abbr
    assert_include \
      @temperature_units.map { |unit| unit[:abbreviation] },
      @tester.temperature_abbr
  end
end
