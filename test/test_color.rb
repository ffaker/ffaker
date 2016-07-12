# encoding: utf-8

require 'helper'

class TestColor < Test::Unit::TestCase
  def test_name
    assert_match(/\A[a-z]+\z/, FFaker::Color.name)
  end

  def test_hex_code
    assert_match /\A\h{6}\z/, FFaker::Color.hex_code
  end

  def test_rgba_array
    fake_array = FFaker::Color.rgba_array

    assert fake_array.size == 4

    red_value = fake_array[0]
    assert_match /^([0-9]{1,3})$/, red_value.to_s
    assert red_value.between? 0, 255

    green_value = fake_array[1]
    assert_match /^([0-9]{1,3})$/, green_value.to_s
    assert green_value.between? 0, 255

    blue_value = fake_array[2]
    assert_match /^([0-9]{1,3})$/, blue_value.to_s
    assert blue_value.between? 0, 255

    opacity_value = fake_array[3]
    assert_match /^([0-9].[0-9]{2})$/, opacity_value.to_s
    assert opacity_value.between? 0.0, 1.0
  end

  def test_rgba_list
    assert_match /^([0-9]{1,3},[0-9]{1,3},[0-9]{1,3}),([0-9].[0-9]{2})$/, FFaker::Color.rgba_list
  end
end
