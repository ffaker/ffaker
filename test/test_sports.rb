require 'test_helper'

class TestSports < Minitest::Test
  def setup
    @tester = FFaker::Sport
  end

  def test_name
    assert_includes @tester::NAMES, @tester.name
  end
end
