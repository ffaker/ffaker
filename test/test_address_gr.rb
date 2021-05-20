# frozen_string_literal: true

require_relative 'helper'

class TestAddressGR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressGR,
    :city, :region, :zip_code, :street_name, :street_nbr, :street_address
  )

  def setup
    @address_gr = FFaker::AddressGR
    @street_prefix = FFaker::AddressGR::STREET_PREFIX.join('|')
  end

  def test_city
    assert_match(/\p{Greek}/, @address_gr.city)
  end

  def test_region
    assert_match(/\p{Greek}/, @address_gr.region)
  end

  def test_zip_code
    assert_match(/\A\d{5}\z/, @address_gr.zip_code)
  end

  def test_street_name
    assert_match(/\p{Greek}/, @address_gr.street_name)
  end

  def test_street_nbr
    assert_match(/\A\d{1,3}\z/, @address_gr.street_nbr)
  end

  def test_street_address
    address = FFaker::AddressGR.street_address
    assert_match(/#{@street_prefix}/, address)
    assert_match(/\p{Greek}/, address)
  end
end
