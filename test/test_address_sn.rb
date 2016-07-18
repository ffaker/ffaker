# encoding: utf-8

# => author: PapePathe github.com/PapePathe
# => email: pathe.sene@gmail.com

require 'helper'

class TestAddressSn < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressSN,
    :region, :departement, :arrondissement
  )

  def setup
    @subject = FFaker::AddressSN
  end

  def test_region
    assert FFaker::AddressSN::REGIONS.include?(FFaker::AddressSN.region)
  end

  def test_departement
    assert FFaker::AddressSN::DEPARTEMENTS.include?(FFaker::AddressSN.departement)
  end

  def test_arrondissement
    assert FFaker::AddressSN::ARRONDISSEMENTS.include?(FFaker::AddressSN.arrondissement)
  end
end
