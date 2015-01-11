# encoding: utf-8

require 'helper'

class TestFakerNameKR < Test::Unit::TestCase
  def setup
    @tester = FFaker::NameKR
  end

  def test_name
    assert FFaker::NameKR.name.length > 2
  end
end
