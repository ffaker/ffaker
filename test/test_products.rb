# frozen_string_literal: true

require_relative 'helper'

class TestProducts < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Product,
    :brand, :product_name, :product, :model
  )

  def test_letters_max_as_int
    assert_match(/\A[A-Z]{10}\z/, FFaker::Product.letters(10))
    assert_deterministic { FFaker::Product.letters(10) }
  end

  def test_letters_max_as_range
    assert_match(/\A[A-Z]{5,10}\z/, FFaker::Product.letters(5..10))
    assert_deterministic { FFaker::Product.letters(5..10) }
  end
end
