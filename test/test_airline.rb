# encoding: utf-8

require 'helper'

class TestAirline < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Airline, :name, :flight_number)

  def test_name
    assert_match(/\A.+\z/, FFaker::Airline.name)
  end

  def test_flight_number
    assert_match(/\w{2,3} \d{1,4}\z/, FFaker::Airline.flight_number)
  end
end
