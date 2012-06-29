# encoding: utf-8
require 'helper'

class TestFakerNameKR < Test::Unit::TestCase
  def setup
    @tester = Faker::NameKR
  end

  def test_name
    assert Faker::NameKR.name.length > 2
  end
end
