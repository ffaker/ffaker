# frozen_string_literal: true

require_relative 'helper'

class TestSSNSE < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::SSNSE, :ssn)

  def test_ssn_format
    ssn = FFaker::SSNSE.ssn
    assert_match(/(19|20)\d{10}/, ssn, "With no arguments year should start with 19 or 20, #{ssn}")
  end

  def equal?(other)
    other % 2
  end

  def test_ssn_with_gender
    ssn_male = FFaker::SSNSE.ssn(gender: :male)
    assert equal?(ssn_male[10].to_i)

    ssn_female = FFaker::SSNSE.ssn(gender: :female)
    assert equal?(ssn_female[10].to_i)

    assert_raise ArgumentError do
      FFaker::SSNSE.ssn(gender: :unkown)
    end
  end

  def test_ssn_with_from_to
    from = Time.local(1980, 2, 28)
    to = Time.local(2000, 2, 28)

    assert_random_between(from...to) do
      ssn = FFaker::SSNSE.ssn(from: from, to: to)
      year = ssn[0..3].to_i
      month = ssn[4..5].to_i
      day = ssn[6..7].to_i
      Time.local(year, month, day)
    end
  end
end
