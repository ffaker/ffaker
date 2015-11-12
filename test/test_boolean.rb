require 'helper'

class TestBoolean < Minitest::Test
  def test_maybe
    maybe = FFaker::Boolean.maybe
    assert (maybe == false || maybe == true)
  end
end
