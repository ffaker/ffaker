# frozen_string_literal: true

require_relative 'helper'

class TestAnimalsPL < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::AnimalPL, :common_name)

  def setup
    @tester = FFaker::AnimalPL
  end

  def test_name
    assert_include(@tester::COMMON_NAMES, @tester.common_name)
  end
end
