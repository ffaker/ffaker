# frozen_string_literal: true

require_relative 'helper'

class TestFakerIdentificationIT < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::IdentificationIT,
    :drivers_license, :ssn, :gender, :ethnicity
  )

  def setup
    @tester = FFaker::IdentificationIT
  end

  def test_drivers_license
    drivers_license_regex = /\AU1[1-9]\d{7}[A-Z]\z/
    assert_match(drivers_license_regex, @tester.drivers_license)
  end

  def test_ssn
    assert_match(/\A\d{20}\z/, @tester.ssn)
  end

  def test_gender
    assert_match(/\A(Maschio|Femmina)\z/, @tester.gender)
  end

  def test_ethnicity
    ethnicity_regex = %r{\A(Afroamericano|Asiatico/isolano del Pacifico|Caucasico|Ispanico|Nativo americano|Multirazziale|Altro|Preferisco non rispondere)\z}
    assert_match(ethnicity_regex, @tester.ethnicity)
  end
end
