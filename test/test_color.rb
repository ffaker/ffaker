# encoding: utf-8

require 'helper'

class TestColor < Test::Unit::TestCase
  def test_name
    assert_match(/\A[a-z]+\z/, FFaker::Color.name)
  end

  def test_hex_code
    assert_match /\A\h{6}\z/, FFaker::Color.hex_code
  end

  def test_rgb_array
    valid_rgb_regex = /\A([0-9]{1,3})\z/
    fake_array = FFaker::Color.rgb_array

    assert fake_array.size == 3

    red_value = fake_array[0]
    assert_match valid_rgb_regex, red_value.to_s
    assert red_value.between? 0, 255

    green_value = fake_array[1]
    assert_match valid_rgb_regex, green_value.to_s
    assert green_value.between? 0, 255

    blue_value = fake_array[2]
    assert_match valid_rgb_regex, blue_value.to_s
    assert blue_value.between? 0, 255
  end

  def test_rgb_list
    assert_match(/\A([0-9]{1,3},[0-9]{1,3},[0-9]{1,3})\z/, FFaker::Color.rgb_list)
  end
end
