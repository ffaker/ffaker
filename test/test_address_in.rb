# frozen_string_literal: true

require_relative 'helper'

class TestAddressININ < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressIN,
    :country_code, :country, :pincode, :state_abbr,
    :state_and_union_territory_abbr, :state_and_union_territory, :state,
    :time_zone, :union_territory_abbr, :union_territory
  )

  def test_in_state
    assert_match(/\A[A-Z][ A-Za-z]*\z/, FFaker::AddressIN.state)
  end

  def test_in_state_abbr
    assert_match(/\A[A-Z]{2}\z/, FFaker::AddressIN.state_abbr)
  end

  def test_in_union_territory
    assert_match(/\A[A-Z][ A-Za-z]*\z/, FFaker::AddressIN.union_territory)
  end

  def test_in_union_territory_abbr
    assert_match(/\A[A-Z]{2}\z/, FFaker::AddressIN.union_territory_abbr)
  end

  def test_in_state_and_union_territory
    assert_match(/\A[A-Z][ A-Za-z]*\z/, FFaker::AddressIN.state_and_union_territory)
  end

  def test_in_state_and_union_territory_abbr
    assert_match(/\A[A-Z]{2}\z/, FFaker::AddressIN.state_and_union_territory_abbr)
  end

  def test_pincode
    assert_match(/[0-9]{6}/, FFaker::AddressIN.pincode)
  end

  def test_zip_code
    assert_match(/[0-9]{6}/, FFaker::AddressIN.pincode)
  end

  def test_in_country
    assert_equal 'India', FFaker::AddressIN.country
  end

  def test_in_country_code
    assert_equal 'IN', FFaker::AddressIN.country_code
  end

  def test_in_time_zone
    assert_equal 'Asia/Kolkata', FFaker::AddressIN.time_zone
  end
end
