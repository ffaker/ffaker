# frozen_string_literal: true

require_relative 'helper'

class TestGeolocation < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Geolocation, :lat, :lng)

  def test_lat
    assert_match(/[0-9]+/, FFaker::Geolocation.lat.to_s)
  end

  def test_lng
    assert_match(/[0-9]+/, FFaker::Geolocation.lng.to_s)
  end

  def test_boxed_coords
    coords_list = [
      [[1, 1], [3, 3]],
      [[12.3455, 23.3434], [34.3434, 36.34343]],
      [[12.3455, 23.3434], [10.3434, 6.34343]]
    ]

    coords_list.each do |coords|
      lat_min = [coords[0][0], coords[1][0]].min
      lat_max = [coords[0][0], coords[1][0]].max
      lon_min = [coords[0][1], coords[1][1]].min
      lon_max = [coords[0][1], coords[1][1]].max

      new_coords = FFaker::Geolocation.boxed_coords(coords[0], coords[1])

      assert (lat_min..lat_max).cover? new_coords[0]
      assert (lon_min..lon_max).cover? new_coords[1]
    end
  end
end
