# encoding: utf-8

require 'helper'

class TestVenue < Minitest::Test
  def test_name
    assert_match /\A[., a-z]+\z/i, FFaker::Venue.name
  end
end
