require 'helper'

class TestIBAN < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::IBAN, :code)

  def test_code
    assert_match(/[A-Z]{2}\d+([A-Z]+)?\d+/, FFaker::IBAN.code)
    assert_match(/[A-Z]{2}\d+([A-Z]+)?\d+/, FFaker::IBAN.code(country_code: 'by'))
    assert_match(/[A-Z]{2}\d+([A-Z]+)?\d+/, FFaker::IBAN.code(country_code: 'BY'))
  end
end
