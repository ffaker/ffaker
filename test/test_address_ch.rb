# encoding: utf-8

require 'helper'

class TestAddressCHCH < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::AddressCH, :canton_abbr, :postal_code)

  def test_ch_canton_abbr
    assert_match(/\A[A-Z]{2}\z/, FFaker::AddressCH.canton_abbr)
  end

  def test_postal_code
    assert_match(/\A\d{4}\z/, FFaker::AddressCH.postal_code)
  end
end
