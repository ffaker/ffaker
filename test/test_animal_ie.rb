# encoding: utf-8

require 'helper'

class TestAnimalsIE < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::AnimalIE, :common_name)

  def setup
    @tester = FFaker::AnimalIE
  end

  def test_name
    assert_include @tester::COMMON_NAMES, @tester.common_name
  end
end
