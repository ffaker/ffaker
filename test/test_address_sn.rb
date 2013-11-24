# encoding: utf-8

# => author: PapePathe github.com/PapePathe
# => email: pathe.sene@gmail.com

require "helper"

class TestAddressSn < Test::Unit::TestCase

  def setup
    @subject = Faker::AddressSN
  end

  def test_region
    assert Faker::AddressSN::REGIONS.include?(Faker::AddressSN.region)
  end

  def test_departement
    assert Faker::AddressSN::DEPARTEMENTS.include?(Faker::AddressSN.departement)
  end

  def test_arrondissement
    assert Faker::AddressSN::ARRONDISSEMENTS.include?(Faker::AddressSN.arrondissement)
  end
end
