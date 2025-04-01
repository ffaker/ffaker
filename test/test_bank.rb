# frozen_string_literal: true

require_relative 'helper'

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
    assert_match(/\A(\d{4} ){3}\d{4}\z/, @tester.card_number)
  end

  def test_card_expiry_date
    assert_instance_of String, @tester.card_expiry_date

    date_today = ::DateTime.now

    assert_random_between(
      date_today.strftime('%y')..date_today.next_year(5).strftime('%y')
    ) do
      @tester.card_expiry_date.split('/').pop
    end

    year_range = 4
    year_latest = 8
    assert_random_between(
      date_today.prev_year(year_latest + year_range).strftime('%y')..date_today.prev_year(year_latest).strftime('%y')
    ) do
      @tester.card_expiry_date(year_range: year_range, year_latest: year_latest).split('/').pop
    end
  end

  def test_card_type
    assert_include @tester::CARD_TYPES, @tester.card_type
  end

  def test_loan_interest_rate
    rate = FFaker::FinanceLoan.loan_interest_rate
    assert(rate.to_f.between?(1.5, 15.0), "Rate #{rate} is out of bounds")
  end

  def test_loan_term
    assert_includes([12, 24, 36, 48, 60, 72, 84], FFaker::FinanceLoan.loan_term)
  end

  def test_loan_amount
    amount = FFaker::FinanceLoan.loan_amount
    assert(amount.between?(1_000, 100_000), "Amount #{amount} is out of bounds")
  end
end
