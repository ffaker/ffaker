# frozen_string_literal: true

require_relative 'helper'

class TestVehicle < Test::Unit::TestCase
  include DeterministicHelper

  # https://en.wikibooks.org/wiki/Vehicle_Identification_Numbers_(VIN_codes)/Check_digit
  VIN_TRANSLITERATION_VALUES = {
    'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8,
    'J' => 1, 'K' => 2, 'L' => 3, 'M' => 4, 'N' => 5, 'P' => 7, 'R' => 9,
    'S' => 2, 'T' => 3, 'U' => 4, 'V' => 5, 'W' => 6, 'X' => 7, 'Y' => 8, 'Z' => 9
  }.freeze
  VIN_POSITION_WEIGHTS = [8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2].freeze

  assert_methods_are_deterministic(
    FFaker::Vehicle,
    :base_color, :drivetrain, :engine_cylinders, :engine_displacement,
    :fuel_type, :interior_upholstery, :make, :manufacturer_color, :mfg_color,
    :model, :transmission_abbr, :transmission, :trim, :vin, :year
  )

  def test_base_color
    assert_match(/\A[a-z]+\z/, FFaker::Vehicle.base_color)
  end

  def test_year
    assert_match(/\A\d{4}\z/, FFaker::Vehicle.year)
  end

  def test_manufacturer_color
    assert_match(/\A[ a-z]+\z/, FFaker::Vehicle.manufacturer_color)
  end

  def test_mfg_color
    assert_match(/\A[ a-z]+\z/, FFaker::Vehicle.mfg_color)
  end

  def test_make
    assert_match(/\A[A-Z][- A-Za-z]+\z/, FFaker::Vehicle.make)
  end

  def test_model
    assert_match(/\A[-. &a-z0-9]+\z/i, FFaker::Vehicle.model)
  end

  def test_trim
    assert_match(/\A[- a-z]+\z/i, FFaker::Vehicle.trim)
  end

  def test_vin
    vin = FFaker::Vehicle.vin

    assert_match(/\A[A-Z0-9]{17}\z/, vin)
    assert_not_match(/[IOQ]/, vin) # VINs can't have these letters
    assert_includes(FFaker::Vehicle::VIN::VALID_ALPHA, vin[6]) # passenger vehicle designator
    assert_includes(FFaker::Vehicle::VIN::VALID_YEAR_CHARS, vin[9]) # check year character
    assert_equal(vin_checksum_digit(vin), vin[8])
  end

  def test_drivetrain
    assert_match(/\A[a-z0-9]+\z/i, FFaker::Vehicle.drivetrain)
  end

  def test_transmission
    assert_match(/\A[ a-z0-9]+\z/i, FFaker::Vehicle.transmission)
  end

  def test_transmission_abbr
    assert_match(/\A[A-Z]{2,3}\z/, FFaker::Vehicle.transmission_abbr)
  end

  def test_engine_cylinders
    assert_match(/\A[a-z0-9]+\z/i, FFaker::Vehicle.engine_cylinders)
  end

  def test_engine_displacement
    assert_match(/\A\d{1,2}\.\d\z/, FFaker::Vehicle.engine_displacement)
  end

  def test_fuel_type
    assert_match(/\A[ a-z0-9()]+\z/i, FFaker::Vehicle.fuel_type)
  end

  def test_interior_upholstery
    assert_match(/\A[ a-z0-9]+\z/i, FFaker::Vehicle.interior_upholstery)
  end

  private

  def vin_checksum_digit(vin)
    weighted_sum = vin.chars.each_with_index.sum do |char, idx|
      (VIN_TRANSLITERATION_VALUES[char] || char).to_i * VIN_POSITION_WEIGHTS[idx]
    end

    check_digit = weighted_sum % 11
    check_digit == '10' ? 'X' : check_digit
    check_digit = 'X' if check_digit == 10
    check_digit.to_s
  end
end
