# encoding: utf-8

require 'helper'

class TestVehicle < Test::Unit::TestCase
  def test_base_color
    assert_match /\A[a-z]+\z/, Faker::Vehicle.base_color
  end

  def test_year
    assert_match /\A\d{4}\z/, Faker::Vehicle.year
  end

  def test_manufacturer_color
    assert_match /\A[ a-z]+\z/, Faker::Vehicle.manufacturer_color
  end

  def test_mfg_color
    assert_match /\A[ a-z]+\z/, Faker::Vehicle.mfg_color
  end

  def test_make
    assert_match /\A[A-Z][- A-Za-z]+\z/, Faker::Vehicle.make
  end

  def test_model
    assert_match /\A[-\. &a-z0-9]+\z/i, Faker::Vehicle.model
  end

  def test_trim
    assert_match /\A[- a-z]+\z/i, Faker::Vehicle.trim
  end

  def test_vin
    assert_match /\A[A-Z0-9]{17}\z/, Faker::Vehicle.vin
  end

  def test_drivetrain
    assert_match /\A[a-z0-9]+\z/i, Faker::Vehicle.drivetrain
  end
end
