require 'helper'

class TestConference < Minitest::Test
  def test_name
    assert_match /1\+|[ a-z]+/i, FFaker::Conference.name
  end
end

