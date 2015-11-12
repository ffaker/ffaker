# encoding: utf-8

require 'helper'

class TestAddressCHFR < Minitest::Test
  def test_ch_fr_canton
    assert_match /\A[- a-zàâäèéêëîïôœùûüÿç]+\z/i, FFaker::AddressCHFR.canton
  end
end
