# frozen_string_literal: true

require_relative 'helper'

class TestFakerIdentification < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Identification,
    :drivers_license, :ssn, :gender, :ethnicity
  )

  def setup
    @tester = FFaker::Identification
  end

  def test_drivers_license
    ###-###-##-###-#
    drivers_license_regex = /\A[A-Z]\d{3}-\d{3}-\d{2}-\d{3}-\d{1}\z/
    assert_match(drivers_license_regex, @tester.drivers_license)
  end

  def test_ssn
    assert_match(/\A\d{3}-\d{2}-\d{4}\z/, @tester.ssn)
  end

  def test_gender
    assert_match(/\A(Male|Female)\z/, @tester.gender)
  end

  def test_ethnicity
    ethnicity_regex = %r{\A(African American|Asian/Pacific Islander|Caucasian|Hispanic|Native American|Multiracial|Other|Prefer not to respond)\z}
    assert_match(ethnicity_regex, @tester.ethnicity)
  end
end
