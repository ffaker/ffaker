# frozen_string_literal: true

require_relative 'helper'

class TestColor < Test::Unit::TestCase
  include DeterministicHelper

  VALID_RGB_REGEX = /\A([0-9]{1,3})\z/.freeze
  VALID_OPACITY_REGEX = /^([0-9].[0-9]{1,2})$/.freeze
  VALID_PERCENTAGE_REGEX = /^([0-9]{1,3}%)$/.freeze

  assert_methods_are_deterministic(
    FFaker::Color,
    :name, :hex_code, :rgb_array, :rgb_list,
    :rgba_array, :rgba_list, :hsl_array, :hsl_list,
    :hsla_array, :hsla_list
  )

  def test_name
    assert_match(/\A[a-z]+\z/, FFaker::Color.name)
  end

  def test_hex_code
    assert_match(/\A\h{6}\z/, FFaker::Color.hex_code)
  end

  def test_rgb_array
    fake_array = FFaker::Color.rgb_array

    assert fake_array.size == 3

    red_value = fake_array[0]
    assert_match VALID_RGB_REGEX, red_value.to_s
    assert red_value.between? 0, 255

    green_value = fake_array[1]
    assert_match VALID_RGB_REGEX, green_value.to_s
    assert green_value.between? 0, 255

    blue_value = fake_array[2]
    assert_match VALID_RGB_REGEX, blue_value.to_s
    assert blue_value.between? 0, 255
  end

  def test_rgb_list
    assert_match(
      /\A([0-9]{1,3},[0-9]{1,3},[0-9]{1,3})\z/,
      FFaker::Color.rgb_list
    )
  end

  def test_rgba_array
    fake_array = FFaker::Color.rgba_array

    assert fake_array.size == 4

    red_value = fake_array[0]
    assert_match VALID_RGB_REGEX, red_value.to_s
    assert red_value.between? 0, 255

    green_value = fake_array[1]
    assert_match VALID_RGB_REGEX, green_value.to_s
    assert green_value.between? 0, 255

    blue_value = fake_array[2]
    assert_match VALID_RGB_REGEX, blue_value.to_s
    assert blue_value.between? 0, 255

    opacity_value = fake_array[3]
    assert_match VALID_OPACITY_REGEX, opacity_value.to_s
    assert opacity_value.between? 0.0, 1.0
  end

  def test_rgba_list
    assert_match(
      /^([0-9]{1,3},[0-9]{1,3},[0-9]{1,3}),([0-9].[0-9]{1,2})$/,
      FFaker::Color.rgba_list
    )
  end

  def test_hsl_array
    fake_array = FFaker::Color.hsl_array

    assert fake_array.size == 3

    hue_value = fake_array[0]
    assert_match VALID_RGB_REGEX, hue_value.to_s
    assert hue_value.between? 0, 360

    saturation_value = fake_array[1]
    assert_match VALID_PERCENTAGE_REGEX, saturation_value
    assert saturation_value.delete('%').to_i.between? 0, 100

    lightness_value = fake_array[2]
    assert_match VALID_PERCENTAGE_REGEX, lightness_value
    assert lightness_value.delete('%').to_i.between? 0, 100
  end

  def test_hsl_list
    assert_match(
      /^([0-9]{1,3},[0-9]{1,3}%,[0-9]{1,3}%)$/,
      FFaker::Color.hsl_list
    )
  end

  def test_hsla_array
    fake_array = FFaker::Color.hsla_array

    assert fake_array.size == 4

    hue_value = fake_array[0]
    assert_match VALID_RGB_REGEX, hue_value.to_s
    assert hue_value.between? 0, 360

    saturation_value = fake_array[1]
    assert_match VALID_PERCENTAGE_REGEX, saturation_value
    assert saturation_value.delete('%').to_i.between? 0, 100

    lightness_value = fake_array[2]
    assert_match VALID_PERCENTAGE_REGEX, lightness_value
    assert lightness_value.delete('%').to_i.between? 0, 100

    opacity_value = fake_array[3]
    assert_match VALID_OPACITY_REGEX, opacity_value.to_s
    assert opacity_value.between? 0.0, 1.0
  end

  def test_hsla_list
    assert_match(
      /^([0-9]{1,3},[0-9]{1,3}%,[0-9]{1,3}%,[0-9].[0-9]{1,2})$/,
      FFaker::Color.hsla_list
    )
  end
end
