# frozen_string_literal: true

require_relative 'helper'

class TestAnimalsES < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::AnimalES, :common_name)

  def setup
    @tester = FFaker::AnimalES
  end

  def test_name
    assert_include @tester::COMMON_NAMES, @tester.common_name
  end
end
