# encoding: utf-8

require 'helper'

class TestMovie < Test::Unit::TestCase
  def test_title
    assert_match /[ a-z]+/, FFaker::Movie.title
  end
end
