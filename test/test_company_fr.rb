# frozen_string_literal: true

require_relative 'helper'

class TestCompanyFR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::CompanyFR,
    :name, :suffix, :siren, :siret
  )

  def test_name
    assert_match(/[ a-z]+/, FFaker::CompanyFR.name)
  end

  def test_suffix
    assert_match(/[ a-z]+/i, FFaker::CompanyFR.suffix)
  end

  def test_french_siren_number
    siren = FFaker::CompanyFR.siren
    assert(siren.match(/\A\d{9}\z/))
    assert(siren[8] == FFaker::CompanyFR.send(:luhn_check, siren[0..-2]).to_s)
  end

  def test_french_siret_number
    siret = FFaker::CompanyFR.siret
    assert(siret.match(/\A\d{14}\z/))
    assert(siret[8] == FFaker::CompanyFR.send(:luhn_check, siret[0..7]).to_s)
    assert(siret[13] == FFaker::CompanyFR.send(:luhn_check, siret[0..-2]).to_s)
  end
end
