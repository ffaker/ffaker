# frozen_string_literal: true

require_relative 'helper'

class TestFakerIdentificationPL < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::IdentificationPL,
    :pesel, :identity_card, :drivers_license
  )

  def setup
    @tester = FFaker::IdentificationPL
  end

  def test_pesel
    assert_match(/\A\d{11}\z/, @tester.pesel)
  end

  def test_identity_card
    assert_match(/\A[A-Z]{3}\d{6}\z/, @tester.identity_card)
  end

  def test_drivers_license
    assert_match(%r{\A\d{5}/\d{2}/\d{4}\z}, @tester.drivers_license)
  end
end
