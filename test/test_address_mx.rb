# frozen_string_literal: true

require_relative 'helper'

class TestAddressMX < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressMX,
    :municipality, :postal_code, :state_abbr, :state, :zip_code
  )

  def test_mx_state
    assert_match(/[\sa-z]/i, FFaker::AddressMX.state)
  end

  def test_mx_state_abbr
    assert_match(/[A-Z]/, FFaker::AddressMX.state_abbr)
  end

  def test_postal_code
    assert_match(/[0-9]/, FFaker::AddressMX.postal_code)
  end

  def test_zip_code
    assert_match(/[0-9]/, FFaker::AddressMX.zip_code)
  end

  def test_mx_municipality
    assert_match(/[\sa-z]/i, FFaker::AddressMX.municipality)
  end
end
