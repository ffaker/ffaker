# frozen_string_literal: true

require_relative 'helper'

class TestSportUS < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::SportUS, :name)

  def setup
    @tester = FFaker::SportUS
  end

  def test_name
    assert_include @tester::NAMES, @tester.name
  end
end
