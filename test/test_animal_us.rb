# frozen_string_literal: true

require_relative 'helper'

class TestAnimalsUS < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::AnimalUS, :common_name)

  def setup
    @tester = FFaker::AnimalUS
  end

  def test_name
    assert_include @tester::COMMON_NAMES, @tester.common_name
  end
end
