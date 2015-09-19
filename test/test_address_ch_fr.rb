# encoding: utf-8

require 'helper'

class TestAddressCHDE < Test::Unit::TestCase
  def test_ch_de_canton
    assert_match /\A[-. a-zæøåü]+\z/i, FFaker::AddressCHDE.canton
  end
end
