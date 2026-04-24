# frozen_string_literal: true

require_relative 'helper'

class TestAddressUK < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressUK,
    :country, :county, :postcode
  )

  def test_county
    assert_match(/[ a-z]/, FFaker::AddressUK.county)
  end

  def test_country
    assert_match(/[ a-z]/, FFaker::AddressUK.country)
  end

  def test_postcode
    # Valid UK postcode formats:
    # A9 9AA, A99 9AA, A9A 9AA, AA9 9AA, AA99 9AA, AA9A 9AA
    # Area: first letter not Q/V/X, second letter (if present) not I/J/Z
    # District suffix (A9A): only ABCDEFGHJKPSTUW
    # District suffix (AA9A): only ABEHMNPRVWXY
    # Inward code: digit + 2 letters (not C/I/K/M/O/V)
    valid_postcode_regex = /\A(
      [A-PR-UWYZ][0-9][ABCDEFGHJKPSTUW]|
      [A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]|
      [A-PR-UWYZ][A-HK-Y][0-9]{1,2}|
      [A-PR-UWYZ][0-9]{1,2}
    )\ [0-9][ABD-HJLNP-UW-Z]{2}\z/x
    assert_match(valid_postcode_regex, FFaker::AddressUK.postcode)
  end
end
