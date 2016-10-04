# encoding: utf-8

require 'helper'

class TestVenue < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Venue, :name)

  def test_name
    assert_match(/\A[., a-z]+\z/i, FFaker::Venue.name)
  end
end
