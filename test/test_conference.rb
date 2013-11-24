# encoding: utf-8

require 'helper'

class TestConference < Test::Unit::TestCase
  def test_name
    assert_match /1\+|[ a-z]+/i, Faker::Conference.name
  end
end

