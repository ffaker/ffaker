# encoding: utf-8

require 'helper'

class TestAirline < Test::Unit::TestCase
  def test_name
    assert_match /\A.+\z/, FFaker::Airline.name
  end
end
