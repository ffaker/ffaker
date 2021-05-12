# frozen_string_literal: true

require_relative 'helper'

class TestFakerFoodPL < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::FoodPL,
    :food, :processed, :unprocessed, :vegetable, :fruit,
    :meat, :herb, :spice, :fermented, :diary, :preserves
  )

  def setup
    @tester = FFaker::FoodPL
  end

  def test_food
    assert_match(/\w+/, @tester.food)
  end

  def test_processed
    assert_match(/\w+/, @tester.processed)
  end

  def test_unprocessed
    assert_match(/\w+/, @tester.unprocessed)
  end

  def test_vegetable
    assert_include(@tester::VEGETABLES, @tester.vegetable)
  end

  def test_fruit
    assert_include(@tester::FRUITS, @tester.fruit)
  end

  def test_herb
    assert_include(@tester::HERBS, @tester.herb)
  end

  def test_spice
    assert_include(@tester::SPICES, @tester.spice)
  end

  def test_meat
    assert_include(@tester::MEATS, @tester.meat)
  end

  def test_fermented
    assert_include(@tester::FERMENTED, @tester.fermented)
  end

  def test_diary
    assert_include(@tester::DIARY, @tester.diary)
  end

  def test_preserves
    assert_include(@tester::PRESERVES, @tester.preserves)
  end
end
