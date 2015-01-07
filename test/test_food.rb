# encoding: UTF-8

require 'helper'

class TestFakerFood < Test::Unit::TestCase
  def test_vegetable
    assert_match /\A[-\/ íó'a-z0-9]+\z/i, Faker::Food.vegetable
  end

  def test_fruit
    assert_match /\A[ a-z0-9]+\z/i, Faker::Food.fruit
  end

  def test_meat
    assert_match /\A[, a-z0-9]+\z/i, Faker::Food.meat
  end

  def test_herb_or_spice
    assert_match /\A[-, a-z0-9]+\z/i, Faker::Food.herb_or_spice
  end
end
