# frozen_string_literal: true

require_relative 'helper'

class TestAnimalsBR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::AnimalBR, :common_name)

  def setup
    @tester = FFaker::AnimalBR
  end

  def test_name
    assert_include @tester::COMMON_NAMES, @tester.common_name
  end
end
