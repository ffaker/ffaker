# encoding: utf-8

require 'helper'

class TestVehicle < Test::Unit::TestCase
  def test_base_color
    assert_match /\A[a-z]+\z/, FFaker::Vehicle.base_color
  end

  def test_year
    assert_match /\A\d{4}\z/, FFaker::Vehicle.year
  end

  def test_manufacturer_color
    assert_match /\A[ a-z]+\z/, FFaker::Vehicle.manufacturer_color
  end

  def test_mfg_color
    assert_match /\A[ a-z]+\z/, FFaker::Vehicle.mfg_color
  end

  def test_make
    assert_match /\A[A-Z][- A-Za-z]+\z/, FFaker::Vehicle.make
  end

  def test_model
    assert_match /\A[-\. &a-z0-9]+\z/i, FFaker::Vehicle.model
  end

  def test_trim
    assert_match /\A[- a-z]+\z/i, FFaker::Vehicle.trim
  end

  def test_vin
    assert_match /\A[A-Z0-9]{17}\z/, FFaker::Vehicle.vin
  end

  def test_drivetrain
    assert_match /\A[a-z0-9]+\z/i, FFaker::Vehicle.drivetrain
  end
end
