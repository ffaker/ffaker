require 'test_helper'

class TestVenue < Minitest::Test
  def test_name
    assert_match /\A[., a-z]+\z/i, FFaker::Venue.name
  end
end
