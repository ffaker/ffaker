# encoding: utf-8

require 'helper'

class TestColor < Test::Unit::TestCase
  def test_name
    assert_match(/\A[a-z]+\z/, FFaker::Color.name)
  end

  def test_hex_code
    assert_match /\A\h{6}\z/, FFaker::Color.hex_code
  end
end
