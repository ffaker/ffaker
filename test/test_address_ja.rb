# frozen_string_literal: true

require_relative 'helper'

class TestAddressJA < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressJA,
    :address,  :other_address, :designated_city_address, :tokyo_ward_address,
    :zip_code, :land_number, :tokyo_ward, :ward, :village, :city, :county,
    :prefecture
  )

  def test_postal_code
    assert_match(/^\d{3}-\d{4}$/, FFaker::AddressJA.postal_code)
  end

  def test_land_number
    assert_match(/^\d丁目\d番\d号|\d{3}$/, FFaker::AddressJA.land_number)
  end

  def test_street
    assert_match(japanese_regex(''), FFaker::AddressJA.street)
  end

  def test_tokyo_ward
    assert_match(japanese_regex('区'), FFaker::AddressJA.tokyo_ward)
  end

  def test_ward
    assert_match(japanese_regex('区'), FFaker::AddressJA.ward)
  end

  def test_village
    assert_match(japanese_regex('村'), FFaker::AddressJA.village)
  end

  def test_designated_city
    assert_match(japanese_regex('[市区]'), FFaker::AddressJA.city)
  end

  def test_city
    assert_match(japanese_regex('市'), FFaker::AddressJA.city)
  end

  def test_county
    assert_match(japanese_regex('郡'), FFaker::AddressJA.county)
  end

  def test_prefecture
    assert_match(japanese_regex('[都道府県]'), FFaker::AddressJA.prefecture)
  end

  def japanese_regex(word)
    /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+#{word}\z/
  end
end
