# encoding: utf-8

require 'helper'

# Author: lurraca github.com/lurraca
class TestUnits < Test::Unit::TestCase

  def setup
    @tester = Faker::Unit
  end

  def test_time_name
    time_name = @tester.time_name
    assert Faker::Unit::TIME_UNITS.any?{ |hash| hash[:name] == time_name }
  end

  def test_time_abbr
    time_abbr = @tester.time_abbr
    assert Faker::Unit::TIME_UNITS.any?{ |hash| hash[:abbreviation] == time_abbr }
  end

  def test_temperature_name
    temperature_name = @tester.temperature_name
    assert Faker::Unit::TEMPERATURE_UNITS.any?{ |hash| hash[:name] == temperature_name }
  end

  def test_temperature_abbr
    temperature_abbr = @tester.temperature_abbr
    assert Faker::Unit::TEMPERATURE_UNITS.any?{ |hash| hash[:abbreviation] == temperature_abbr }
  end

end
