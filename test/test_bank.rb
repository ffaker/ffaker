# frozen_string_literal: true

require 'helper'

class TestBank < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Bank,
    :iban, :card_number, :card_expiry_date, :card_type
  )

  def setup
    @tester = FFaker::Bank
  end

  def test_iban
    assert_match(/[A-Z]{2}\d+([A-Z]+)?\d+/, @tester.iban)
    assert_match(/[A-Z]{2}\d+([A-Z]+)?\d+/, @tester.iban(country_code: 'by'))
    assert_match(/[A-Z]{2}\d+([A-Z]+)?\d+/, @tester.iban(country_code: 'BY'))
    assert_raise ArgumentError, "Unexpected country code: 'unknown'" do
      @tester.iban(country_code: 'unknown')
    end
  end

  def test_card_number
    assert_match(/\A\d{4}-\d{4}-\d{4}-\d{4}\z/, @tester.card_number)
  end

  def test_card_expiry_date
    assert_instance_of Date, @tester.card_expiry_date

    current_year = ::DateTime.now.year

    assert_random_between(current_year, current_year + 5) do
      @tester.card_expiry_date.year
    end

    year_range = 4
    year_latest = 8
    assert_random_between(
      current_year - year_latest - year_range,
      current_year - year_latest
    ) do
      @tester.card_expiry_date(
        year_range: year_range, year_latest: year_latest
      ).year
    end
  end

  def test_card_type
    assert_include @tester::CARD_TYPES, @tester.card_type
  end
end
