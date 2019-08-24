# frozen_string_literal: true

require 'helper'

class TestBank < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Bank, :iban)

  def test_iban
    assert_match(/[A-Z]{2}\d+([A-Z]+)?\d+/, FFaker::Bank.iban)
    assert_match(/[A-Z]{2}\d+([A-Z]+)?\d+/, FFaker::Bank.iban(country_code: 'by'))
    assert_match(/[A-Z]{2}\d+([A-Z]+)?\d+/, FFaker::Bank.iban(country_code: 'BY'))
    assert_raise ArgumentError, "Unexpected country code: 'unknown'" do
      FFaker::Bank.iban(country_code: 'unknown')
    end
  end
end
