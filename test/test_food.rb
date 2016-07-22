# encoding: UTF-8

require 'helper'

class TestFakerFood < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Food,
    :vegetable, :fruit, :meat, :herb_or_spice
  )

  def test_vegetable
    assert_match(/\A[-\/ íó'a-z0-9]+\z/i, FFaker::Food.vegetable)
  end

  def test_fruit
    assert_match(/\A[ a-z0-9]+\z/i, FFaker::Food.fruit)
  end

  def test_meat
    assert_match(/\A[, a-z0-9]+\z/i, FFaker::Food.meat)
  end

  def test_herb_or_spice
    assert_match(/\A[-, a-z0-9]+\z/i, FFaker::Food.herb_or_spice)
  end
end
