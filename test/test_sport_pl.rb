# frozen_string_literal: true

require_relative 'helper'

class TestSportPL < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::SportPL,
    :name,
    :summer,
    :winter
  )

  def setup
    @tester = FFaker::SportPL
  end

  def test_name
    assert_include(@tester::ALL, @tester.name)
  end

  def test_summer
    assert_include(@tester::SUMMER, @tester.summer)
  end

  def test_winter
    assert_include(@tester::WINTER, @tester.winter)
  end
end
