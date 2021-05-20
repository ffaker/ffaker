# frozen_string_literal: true

require_relative 'helper'

class TestBoolean < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Boolean, :maybe)

  def test_maybe
    maybe = FFaker::Boolean.maybe
    assert [true, false].include?(maybe)
  end
end
