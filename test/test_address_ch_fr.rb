# encoding: utf-8

require 'helper'

class TestAddressCHDE < Minitest::Test
  def test_ch_de_canton
    assert_match /\A[-. a-zæøåü]+\z/i, FFaker::AddressCHDE.canton
  end
end
