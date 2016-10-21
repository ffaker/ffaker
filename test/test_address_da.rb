# encoding: utf-8

require 'helper'

class TestAddressDA < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressDA,
    :city, :full_address, :kommune, :post_nr, :region, :state, :street_address,
    :street_name, :zip_code
  )

  def test_zip_code
    assert_match(/\A\d{4}\z/, FFaker::AddressDA.zip_code)
  end

  def test_post_nr
    assert_match(/\A\d{4}\z/, FFaker::AddressDA.post_nr)
  end

  def test_state
    assert_match(/\A[-ÆØÅæøåa-z-]+\z/i, FFaker::AddressDA.state)
  end

  def test_kommune
    assert_match(/\A[-ÆØÅæøåa-z-]+\z/i, FFaker::AddressDA.kommune)
  end

  def test_region
    assert_match(/\A[ÆØÅæøåa-z-]+\z/i, FFaker::AddressDA.region)
  end

  def test_city
    assert_match(/\A[- ÆØÅæøåla-z-]+\z/i, FFaker::AddressDA.city)
  end

  def test_street_name
    assert_match(/\A[. éÆØÅæøåla-z0-9-]+\z/i, FFaker::AddressDA.street_name)
  end

  def test_street_address
    assert_match(/\A[. éÆØÅæøåla-z0-9-]+\z/i, FFaker::AddressDA.street_address)
  end

  def test_full_address
    assert_match(/\A[. éÆØÅæøåla-z0-9-]+ DANMARK\z/i,
                 FFaker::AddressDA.full_address)
  end
end
