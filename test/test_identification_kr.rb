# encoding: utf-8

require 'helper'

class TestFakerIdentificationKr < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::IdentificationKr, :rrn)

  def setup
    @tester = FFaker::IdentificationKr
  end

  def test_rrn
    assert_match(/\A\d{6}-\d{7}\z/, @tester.rrn)
  end
end
