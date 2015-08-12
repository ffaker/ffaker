# encoding: utf-8

require 'helper'

class TestAddressCHCH < Test::Unit::TestCase
  def test_ch_canton_abbr
    assert_match /[A-Z]/, FFaker::AddressCH.canton_abbr
  end

  def test_postal_code
    assert_match /[0-9]/, FFaker::AddressCH.postal_code
  end
end
