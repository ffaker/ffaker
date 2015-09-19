# encoding: utf-8

require 'helper'

class TestAddressCHFR < Test::Unit::TestCase
  def test_ch_fr_canton
    assert_match /[A-Z]/, FFaker::AddressCHFR.canton
  end
end
