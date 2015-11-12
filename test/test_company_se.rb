# encoding: utf-8

require 'helper'

class TestCompanySE < Minitest::Test

  def test_name
    assert_match(/[ a-z]+/, FFaker::CompanySE.name)
  end

  def test_suffix
    assert_match(/[ a-z]+/i, FFaker::CompanySE.suffix)
  end
end
