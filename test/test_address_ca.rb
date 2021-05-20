# frozen_string_literal: true

require_relative 'helper'

class TestAddressCA < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressCA,
    :province, :province_abbr, :city, :postal_code
  )

  def test_province
    assert_match(/\A[ a-z]+\z/i, FFaker::AddressCA.province)
  end

  def test_province_abbr
    assert_match(/\A[A-Z]{2}\z/, FFaker::AddressCA.province_abbr)
  end

  def test_city
    assert_include(FFaker::AddressCA::CITY, FFaker::AddressCA.city)
  end

  def test_postal_code
    assert_match(
      /\A[A-CEGHJK-NPR-TVXY]\d[A-CEGHJK-NPR-TV-Z] \d[A-CEGHJK-NPR-TV-Z]\d\z/,
      FFaker::AddressCA.postal_code
    )
  end
end
