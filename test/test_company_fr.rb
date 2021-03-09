# frozen_string_literal: true

require 'helper'

class TestCompanyFR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::CompanyFR,
    :name, :suffix, :french_siren_number, :french_siret_number
  )

  def test_name
    assert_match(/[ a-z]+/, FFaker::CompanyFR.name)
  end

  def test_suffix
    assert_match(/[ a-z]+/i, FFaker::CompanyFR.suffix)
  end

  def test_french_siren_number
    assert_match(/\A\d{9}\z/, FFaker::CompanyFR.french_siren_number)
  end

  def test_french_siret_number
    assert_match(/\d{14}/, FFaker::CompanyFR.french_siret_number)
  end

  def test_french_siren_number_from_faker
    siren = FFaker::CompanyFR.french_siren_number
    assert siren.match(/\A\d{9}\z/)
    assert siren[8] == FFaker::CompanyFR.send(:luhn_check, siren[0..-2]).to_s
  end
  
  def test_french_siret_number_from_faker
    siret = FFaker::CompanyFR.french_siret_number
    assert siret.match(/\A\d{14}\z/)
    assert siret[8] == FFaker::CompanyFR.send(:luhn_check, siret[0..7]).to_s
    assert siret[13] == FFaker::CompanyFR.send(:luhn_check, siret[0..-2]).to_s
  end
end
