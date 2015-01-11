# encoding: utf-8

require 'helper'

class TestFakerNameCN < Test::Unit::TestCase
  def setup
    @tester = FFaker::NameCN
  end

  def test_name
    assert FFaker::NameCN.name.length > 2
  end
end
