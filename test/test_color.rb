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
    fake_array = FFaker::Color.rgb_array

    assert fake_array.size == 3

    first_value = fake_array[0]
    assert_match /^([0-9]{1,3})$/, first_value.to_s
    assert first_value.between? 0, 255

    second_value = fake_array[1]
    assert_match /^([0-9]{1,3})$/, second_value.to_s
    assert second_value.between? 0, 255

    third_value = fake_array[2]
    assert_match /^([0-9]{1,3})$/, third_value.to_s
    assert third_value.between? 0, 255
  end

  def test_rgb_list
    assert_match /^([0-9]{1,3},[0-9]{1,3},[0-9]{1,3})$/, FFaker::Color.rgb_list
  end
end
