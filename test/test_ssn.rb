# frozen_string_literal: true

require_relative 'helper'

class TestSSN < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::SSN, :ssn)

  def setup
    @actual_ssn = FFaker::SSN.ssn
  end

  def test_ssn_format
    assert_no_match(/\A666/, @actual_ssn)
    assert_match(/\A[0-8]\d{2}-\d{2}-\d{4}\Z/, @actual_ssn)
  end

  def test_ssn_groups_non_zero
    first_group, second_group, third_group = @actual_ssn.split('-')
    with_all_zeros = /\A0+\Z/

    assert_no_match(with_all_zeros, first_group)
    assert_no_match(with_all_zeros, second_group)
    assert_no_match(with_all_zeros, third_group)
  end
end
