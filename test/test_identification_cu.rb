# frozen_string_literal: true

require_relative 'helper'
require 'date'

class TestFakerIdentificationCU < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::IdentificationCU, :ci)

  def setup
    @tester = FFaker::IdentificationCU
  end

  def test_ci
    100.times do
      ci = @tester.ci
      assert_match(/\A\d{11}\z/, ci)
      assert_valid_birth_date(ci)
      assert_operator ci[6].to_i, :<=, 9
      assert_operator ci[9].to_i, :<=, 9
    end
  end

  private

  def assert_valid_birth_date(ci)
    yy = ci[0, 2].to_i
    mm = ci[2, 2].to_i
    dd = ci[4, 2].to_i
    century_digit = ci[6].to_i

    year = full_year(yy, century_digit)
    assert_nothing_raised do
      ::Date.new(year, mm, dd)
    end
  end

  def full_year(year, century_digit)
    case century_digit
    when 9 then 1800 + year
    when 0..5 then 1900 + year
    when 6..8 then 2000 + year
    end
  end
end
