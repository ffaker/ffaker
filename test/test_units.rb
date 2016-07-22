# encoding: utf-8

require 'helper'

# Author: lurraca github.com/lurraca
class TestUnits < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Unit,
    :time_name, :time_abbr, :temperature_name, :temperature_abbr
  )

  def setup
    @tester = FFaker::Unit
    @time_units = @tester::TIME_UNITS.map { |u| OpenStruct.new u }
    @temperature_units = @tester::TEMPERATURE_UNITS.map { |u| OpenStruct.new u }
  end

  def test_time_name
    assert_include @time_units.map(&:name), @tester.time_name
  end

  def test_time_abbr
    assert_include @time_units.map(&:abbreviation), @tester.time_abbr
  end

  def test_temperature_name
    assert_include @temperature_units.map(&:name), @tester.temperature_name
  end

  def test_temperature_abbr
    assert_include \
      @temperature_units.map(&:abbreviation),
      @tester.temperature_abbr
  end
end
