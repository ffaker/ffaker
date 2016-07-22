# encoding: utf-8

require 'helper'

class TestSSN < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::SSN, :ssn)

  def test_ssn
    assert_match(/\d{3}-\d{2}-\d{3}/, FFaker::SSN.ssn)
  end
end
