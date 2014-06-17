# encoding: utf-8

require File.dirname(__FILE__) + '/helper'

class TestFakerNameJA < Test::Unit::TestCase
  def setup
    @tester = Faker::NameJA
  end

  def test_name
    assert Faker::NameJA.name.length >= 2
  end
end
