# encoding: utf-8

require 'helper'

class TestSports < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Sport, :name)

  def setup
    @tester = FFaker::Sport
  end

  def test_name
    assert_include @tester::NAMES, @tester.name
  end
end
