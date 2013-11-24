# encoding: utf-8

require 'helper'

class TestFakerIdentificationESCL < Test::Unit::TestCase
  def setup
    @tester = Faker::IdentificationESCL
  end

  def test_rut
    assert_match /\b\d{7,8}\-[k|0-9]/i, @tester.rut
  end
end
