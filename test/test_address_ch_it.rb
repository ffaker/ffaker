# encoding: utf-8

require 'helper'

class TestAddressCHIT < Test::Unit::TestCase
  def test_ch_it_canton
    FFaker::AddressCHIT::CANTON.each do |canton|
      assert_match /\A[- a-zàâ]+\z/i, canton
    end
  end
end
