# encoding: utf-8
require 'helper'

class TestFakerNameCN < Test::Unit::TestCase
  def setup
    @tester = Faker::NameCN
  end

  def test_name
    assert Faker::NameCN.name.length > 2
  end
end
