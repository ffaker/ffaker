# encoding: utf-8

require 'helper'

class TestMovie < Test::Unit::TestCase
  def test_name
    assert_match /[ a-z]+/, FFaker::Sport.name
  end
end
