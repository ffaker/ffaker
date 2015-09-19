# encoding: utf-8

require 'helper'

class TestAddressCHIT < Test::Unit::TestCase
  def test_ch_it_canton
    assert_match /[A-Z]/, FFaker::AddressCHIT.canton
  end
end
