# encoding: utf-8

require 'helper'

class TestSSN < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::SSN, :ssn)

  def setup
    @actual_ssn = FFaker::SSN.ssn
  end

  def test_ssn_format
    assert_match(/\A\d{3}-\d{2}-\d{4}\Z/, @actual_ssn)
  end

  def test_ssn_first_group_in_valid_range
    first_group, *_other = ssn_to_number_groups(@actual_ssn)

    assert(first_group != 666)
    assert(first_group < 900)
  end

  def test_ssn_second_group_non_zero
    _first, second_group, _third = ssn_to_number_groups(@actual_ssn)

    assert(second_group.positive?)
  end

  def test_ssn_third_group_non_zero
    *_other, third_group = ssn_to_number_groups(@actual_ssn)

    assert(third_group.positive?)
  end

  private

  def ssn_to_number_groups(ssn)
    groups = ssn.split('-')

    numbers = groups.map { |g| strip_leading_zeros(g) }
                    .map { |g| Integer(g) }

    numbers
  end

  def strip_leading_zeros(string)
    string.gsub(/\A0+(?!\Z)/, '')
  end
end
