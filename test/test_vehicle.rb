# encoding: utf-8

require 'helper'

class TestVehicle < Test::Unit::TestCase
  include DeterministicHelper

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
    assert_match(/\A[-\. &a-z0-9]+\z/i, FFaker::Vehicle.model)
  end

  def test_trim
    assert_match(/\A[- a-z]+\z/i, FFaker::Vehicle.trim)
  end

  def test_vin
    assert_match(/\A[A-Z0-9]{17}\z/, FFaker::Vehicle.vin)
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
    assert_match(/\A[ a-z0-9\(\)]+\z/i, FFaker::Vehicle.fuel_type)
  end

  def test_interior_upholstery
    assert_match(/\A[ a-z0-9]+\z/i, FFaker::Vehicle.interior_upholstery)
  end
end
