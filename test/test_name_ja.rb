# encoding: utf-8

require 'helper'

class TestFakerNameJA < Test::Unit::TestCase
  def setup
    @tester = FFaker::NameJA
  end

  def test_name
    assert FFaker::NameJA.name.length >= 2
  end
end
