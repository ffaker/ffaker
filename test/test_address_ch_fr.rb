# encoding: utf-8

require 'helper'

class TestAddressCHDE < Test::Unit::TestCase
  def test_ch_de_canton
    assert_match /[A-Z]/, FFaker::AddressCHDE.canton
  end
end
