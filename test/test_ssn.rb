# encoding: utf-8

require 'helper'

class TestSSN < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::SSN, :ssn)

  def test_ssn_format
    assert_match(/\d{3}-\d{2}-\d{3}/, FFaker::SSN.ssn)
  end

  def test_ssn_first_group_in_valid_range
    ssn = FFaker::SSN.ssn
    first_group, *_other_groups = ssn.split('-')

    first_number = Integer(first_group)

    assert first_number != 666
    assert first_number  < 900
  end

  def test_ssn_second_group_non_zero
    ssn = FFaker::SSN.ssn
    _first_group, second_group, _third_group = ssn.split('-')

    second_number = Integer(second_group)

    assert second_number.positive?
  end

  def test_ssn_third_group_non_zero
    ssn = FFaker::SSN.ssn
    _first_group, _second_group, third_group = ssn.split('-')

    third_number = Integer(third_group)

    assert third_number.positive?
  end
end
