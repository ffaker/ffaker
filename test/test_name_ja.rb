# encoding: utf-8

require 'helper'

class TestFakerNameJA < Test::Unit::TestCase
  def setup
    @tester = FFaker::NameJA
  end

  def test_name
    assert @tester.name.length >= 2
  end
end
