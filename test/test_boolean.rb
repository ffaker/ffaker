# encoding: utf-8

require 'helper'

class TestBoolean < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Boolean, :maybe)

  def test_maybe
    maybe = FFaker::Boolean.maybe
    assert (maybe == false || maybe == true)
  end
end
